

import 'package:flutter/material.dart';

class GmHomePage extends StatefulWidget {
  static const String ROUTE_NAME = "/gm_home_page";
  const GmHomePage({super.key});

  @override
  State<GmHomePage> createState() => _GmHomePageState();
}

class _GmHomePageState extends State<GmHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("GM Home Page"),
      )
    );
  }
}
