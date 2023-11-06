import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/common/date_converter.dart';
import 'package:grandatma_mobile/presentation/pages/owner/profile/owner_edit_password_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';
import '../../../bloc/customer/profile/profile_bloc.dart';
import '../../../widgets/user_profile_card.dart';
import '../../auth/signin_page.dart';

class OwnerProfilePage extends StatefulWidget {
  static const String ROUTE_NAME = "/owner_profile_page";

  const OwnerProfilePage({super.key});

  @override
  State<OwnerProfilePage> createState() => _OwnerProfilePageState();
}

class _OwnerProfilePageState extends State<OwnerProfilePage> {
  @override
  void initState() {
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
                      joinDate: DateConverter(state.userDetail.createdAt ?? DateTime.now()),
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
                  onTap: ()  {
                    Navigator.pushNamed(context, OwnerEditPasswordPage.ROUTE_NAME);
                  }
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
                    await prefs.clear();
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
