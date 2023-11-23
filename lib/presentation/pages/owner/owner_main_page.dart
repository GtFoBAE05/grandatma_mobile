
import 'package:flutter/material.dart';
import 'package:grandatma_mobile/presentation/pages/owner/home/owner_home_page.dart';
import 'package:grandatma_mobile/presentation/pages/owner/profile/owner_profile_page.dart';
import 'package:grandatma_mobile/presentation/pages/owner/report/owner_report_main_page.dart';

import '../auth/signin_page.dart';

class OwnerMainPage extends StatefulWidget {
  static const ROUTE_NAME = '/owner_main_page';
  const OwnerMainPage({super.key});

  @override
  State<OwnerMainPage> createState() => _OwnerMainPageState();
}

class _OwnerMainPageState extends State<OwnerMainPage> {
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
        return OwnerHomePage();
      case 1:
        return OwnerReportMainPage();
      case 2:
        return OwnerProfilePage();
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
          icon: Icon(Icons.list),
          label: 'Report',
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
