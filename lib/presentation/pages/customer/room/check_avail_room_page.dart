import 'package:flutter/material.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/order_receipt_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/reservation_confirmation_page.dart';

class CheckAvailRoomPage extends StatefulWidget {
  static const ROUTE_NAME = "/check_avail_room_page";

  const CheckAvailRoomPage({super.key});

  @override
  State<CheckAvailRoomPage> createState() => _CheckAvailRoomPageState();
}

class _CheckAvailRoomPageState extends State<CheckAvailRoomPage> {
  DateTimeRange? _selectedDateRange;


  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      setState(() {
        _selectedDateRange = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Check Available Room',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
         mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Start Date
          ListTile(
            title: Text("Start Date"),
            subtitle: Text(
              "Start date: ${_selectedDateRange?.start.toString().split(' ')[0]}",
            ),
            trailing: Icon(Icons.calendar_today),
            onTap: _show,
          ),
          // End Date
          ListTile(
            title: Text("End Date"),
            subtitle: Text(
              "End date: ${_selectedDateRange?.end.toString().split(' ')[0]}",
            ),
            trailing: Icon(Icons.calendar_today),
            onTap: _show,
          ),
          // Search Button
          ElevatedButton(
            onPressed: () {
              print("Start date: ${_selectedDateRange?.start.toString().split(' ')[0]}");
              print("End date: ${_selectedDateRange?.end.toString().split(' ')[0]}");
              // Navigator.of(context).pushNamed(OrderReceiptPage.ROUTE_NAME, arguments: {
              //   "idReservation" : "P51123-13",
              // });
              Navigator.of(context).pushNamed(
                "/room_list_page",
                arguments: {
                  // "startDate": "2023-11-09",
                  // "endDate": "2023-11-10",
                  "startDate": "${_selectedDateRange?.start.toString().split(' ')[0]}",
                  "endDate": "${_selectedDateRange?.end.toString().split(' ')[0]}",
                },
              );
            },
            child: Text("Search"),
          ),
        ],
      ),
    );
  }
}
