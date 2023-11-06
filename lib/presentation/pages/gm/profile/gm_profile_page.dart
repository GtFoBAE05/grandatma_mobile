import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/gm/profile/gm_edit_password_page.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import '../../../bloc/customer/profile/profile_bloc.dart';
import '../../../widgets/user_profile_card.dart';
import '../../auth/signin_page.dart';

class GmProfilePage extends StatefulWidget {
  static const String ROUTE_NAME = '/gm_profile_page';

  const GmProfilePage({super.key});

  @override
  State<GmProfilePage> createState() => _GmProfilePageState();
}

class _GmProfilePageState extends State<GmProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() {
      context.read<ProfileBloc>().add(FetchUserDetail());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Profile',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  if (state is ProfileInitial || state is ProfileLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is ProfileSuccess) {
                    return UserProfileCard(
                      profileImage:
                      "https://pbs.twimg.com/media/F8fM17DaQAAb016?format=jpg&name=large",
                      name: state.userDetail.nama,
                      joinDate: state.userDetail.createdAt.toString(),
                    );
                  } else if (state is ProfileError) {
                    return Center(
                      key: Key('error_message'),
                      child: Text(state.message),
                    );
                  } else {
                    return Center(
                      child: Text("ERR"),
                    );
                  }
                },
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'My account',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text('Change password'),
                trailing: Icon(Icons.arrow_forward_ios,
                  size: 15,),
                onTap: () {
                  Navigator.pushNamed(context, GmEditPasswordPage.ROUTE_NAME);
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                  )
              ),
              ListTile(
                  title: Text('Logout'),
                  trailing: Icon(Icons.arrow_forward_ios,
                    size: 15,),
                  onTap: () async {
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.clear();
                    navigatorKey.currentState?.pushReplacementNamed("/");
                  }
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                  )
              ),

            ],
          ),
        )
    );
  }
}
