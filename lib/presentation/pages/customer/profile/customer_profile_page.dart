import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/common/date_converter.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/profile/profile_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/auth/signin_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/profile/customer_edit_password_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/transaction/transaction_unpaid_page.dart';
import 'package:grandatma_mobile/presentation/widgets/user_profile_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../main.dart';

class CustomerProfilePage extends StatefulWidget {
  const CustomerProfilePage({Key? key}) : super(key: key);
  static const ROUTE_NAME = '/customer_profile_page';

  @override
  State<CustomerProfilePage> createState() => _CustomerProfilePageState();
}

class _CustomerProfilePageState extends State<CustomerProfilePage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<ProfileBloc>().add(FetchUserDetail());
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
                    return InkWell(
                        child: UserProfileCard(
                          profileImage:
                              "https://pbs.twimg.com/media/F8fM17DaQAAb016?format=jpg&name=large",
                          name: state.userDetail.nama,
                          joinDate: DateConverter(state.userDetail.createdAt ?? DateTime.now())
                        ),
                        onTap: () {
                          Navigator.pushNamed(
                              context, '/customer_edit_profile_page',
                              arguments: {
                                'name': state.userDetail.nama,
                                'email': state.userDetail.email,
                                'phone': state.userDetail.notelp,
                                'username': state.userDetail.username,
                              });
                        });
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
                  'Transaction',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text('Unpaid Transaction'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                onTap: () {
                  Navigator.pushNamed(
                      context, TransactionUnpaidPage.ROUTE_NAME);
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'My account',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              ListTile(
                title: Text('Change password'),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                ),
                onTap: () {
                  Navigator.pushNamed(
                          context, CustomerEditPasswordPage.ROUTE_NAME);
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                  )),
              BlocBuilder<ProfileBloc, ProfileState>(
                builder: (context, state) {
                  return ListTile(
                      title: Text('Logout'),
                      trailing: Icon(
                        Icons.arrow_forward_ios,
                        size: 15,
                      ),
                      onTap: () async {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        await prefs.clear();
                        navigatorKey.currentState?.pushReplacementNamed("/");
                      });
                },
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Divider(
                    height: 1,
                    thickness: 1,
                  )),
            ],
          ),
        ));
  }

// @override
// Widget build(BuildContext context) {
//   return Scaffold(
//     appBar: AppBar(
//       title: Text(
//         'Profile',
//         style: TextStyle(color: Colors.black),
//       ),
//       centerTitle: true,
//       backgroundColor: Colors.white,
//       elevation: 0,
//     ),
//     body: BlocBuilder<ProfileBloc, ProfileState>(
//       builder: (context, state) {
//         if (state is ProfileInitial || state is ProfileLoading) {
//           return Center(
//             child: CircularProgressIndicator(),
//           );
//         } else if (state is ProfileSuccess) {
//           return Container(
//             color: Colors.white,
//             padding: EdgeInsets.all(20.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Center(
//                   child:
//                   UserProfileCard(
//                     profileImage:
//                     "https://pbs.twimg.com/media/F8fM17DaQAAb016?format=jpg&name=large",
//                     name: state.userDetail.nama,
//                     joinDate: state.userDetail.createdAt.toString(),
//                   ),
//                 ),
//                 SizedBox(height: 30),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: Text(
//                     'Informasi Akun',
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 ListTile(
//                   title: Text('Ubah password'),
//                   trailing: Icon(Icons.arrow_forward_ios,
//                     size: 15,),
//                   onTap: () {
//                     Navigator.pushNamed(context, '/customer_edit_password_page');
//                   },
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Divider(
//                       height: 1,
//                       thickness: 1,
//                     )
//                 ),
//                 ListTile(
//                   title: Text('Keluar'),
//                   trailing: Icon(Icons.arrow_forward_ios,
//                     size: 15,),
//                 ),
//                 Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: Divider(
//                       height: 1,
//                       thickness: 1,
//                     )
//                 ),
//
//               ],
//             ),
//           );
//         } else if (state is ProfileError) {
//           return Center(
//             key: Key('error_message'),
//             child: Text(state.message),
//           );
//         } else {
//           return Center(
//             child: Text("ERR"),
//           );
//         }
//       },
//     ),
//   );
// }
}
