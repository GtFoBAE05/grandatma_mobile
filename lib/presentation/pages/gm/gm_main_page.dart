
import 'package:flutter/material.dart';
import 'package:grandatma_mobile/presentation/pages/gm/profile/gm_profile_page.dart';

import '../auth/signin_page.dart';
import 'home/gm_home_page.dart';

class GmMainPage extends StatefulWidget {
  static const ROUTE_NAME = '/gm_main_page';
  const GmMainPage({super.key});

  @override
  State<GmMainPage> createState() => _GmMainPageState();
}

class _GmMainPageState extends State<GmMainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _getBody(),
      bottomNavigationBar: bottomNavigationBar(),
    );
  }

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return GmHomePage();
      case 1:
        return GmProfilePage();
      default:

        return SigninPage();
    }
  }

  Widget bottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _selectedIndex,
      onTap: (index) {
        setState(() {
          _selectedIndex = index;
        });
      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
