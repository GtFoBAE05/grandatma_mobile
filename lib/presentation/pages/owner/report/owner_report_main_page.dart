import 'package:flutter/material.dart';
import 'package:grandatma_mobile/presentation/pages/owner/report/new_customer/owner_new_customer_main_page.dart';
import 'package:grandatma_mobile/presentation/pages/owner/report/top_customer/owner_top_customer_page.dart';

class OwnerReportMainPage extends StatefulWidget {
  static const ROUTE_NAME = '/report_main_page';
  const OwnerReportMainPage({super.key});

  @override
  State<OwnerReportMainPage> createState() => _OwnerReportMainPageState();
}

class _OwnerReportMainPageState extends State<OwnerReportMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Grandatma Report',
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
              ListTile(
                  title: Text('New Customer Report'),
                  trailing: Icon(Icons.arrow_forward_ios,
                    size: 15,),
                  onTap: () {
                    Navigator.pushNamed(
                        context, OwnerNewCustomerReportMainPage.ROUTE_NAME);
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
                  title: Text('Top Customer Report'),
                  trailing: Icon(Icons.arrow_forward_ios,
                    size: 15,),
                  onTap: () {
                    Navigator.pushNamed(
                        context, OwnerTopCustomerPage.ROUTE_NAME);
                  }
              ),


            ],
          ),
        )
    );
  }
}
