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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/your_image.png', // Ganti dengan path gambar yang kamu punya
            //   height: 150,
            // ),
            // SizedBox(height: 20),
            ListTile(
              title: Text(
                "Start Date",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: _selectedDateRange == null
                  ? Text("Select start date")
                  : Text(
                "Start date: ${_selectedDateRange?.start.toString().split(' ')[0]}",
              ),
              trailing: Icon(Icons.calendar_today),
              onTap: _show,
            ),
            ListTile(
              title: Text(
                "End Date",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: _selectedDateRange == null
                  ? Text("Select end date")
                  : Text(
                "End date: ${_selectedDateRange?.end.toString().split(' ')[0]}",
              ),
              trailing: Icon(Icons.calendar_today),
              onTap: _show,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.orange, // Ganti warna sesuai selera
              ),
              onPressed: _selectedDateRange == null
                  ? null
                  : () {
                print("Start date: ${_selectedDateRange?.start.toString().split(' ')[0]}");
                print("End date: ${_selectedDateRange?.end.toString().split(' ')[0]}");
                Navigator.of(context).pushNamed(
                  "/room_list_page",
                  arguments: {
                    "startDate": "${_selectedDateRange?.start.toString().split(' ')[0]}",
                    "endDate": "${_selectedDateRange?.end.toString().split(' ')[0]}",
                  },
                );
              },
              child: Text("Search", style: TextStyle(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

}
