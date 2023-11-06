import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:grandatma_mobile/presentation/pages/auth/signin_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/profile/customer_profile_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/transaction/transaction_history_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../common/utils.dart';
import '../../../main.dart';
import 'home/customer_home_page.dart';

class CustomerMainPage extends StatefulWidget {
  static const ROUTE_NAME = '/customer_main_page';

  const CustomerMainPage({Key? key}) : super(key: key);

  @override
  State<CustomerMainPage> createState() => _CustomerHomePageState();
}

class _CustomerHomePageState extends State<CustomerMainPage> {
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
        return CustomerHomePage();
      case 1:
        return CustomerTransactionHistoryPage();
      case 2:
        return CustomerProfilePage();
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
          icon: Icon(Icons.history),
          label: 'Transaction',
        ),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
    );
  }
}
