

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OwnerHomePage extends StatefulWidget {
  static const String ROUTE_NAME = '/owner_home_page';
  const OwnerHomePage({super.key});

  @override
  State<OwnerHomePage> createState() => _OwnerHomePageState();
}

class _OwnerHomePageState extends State<OwnerHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text('Owner Home Page'),
      ),
    );
  }
}
