import 'package:flutter/material.dart';
import 'package:grandatma_mobile/presentation/pages/customer/customer_main_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/add_paid_facilities_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/add_reservation_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/checkout_confirmation_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/order_receipt_page.dart';

class ReservationConfirmationPage extends StatefulWidget {
  static const ROUTE_NAME = "/reservation_confirmation_page";

  const ReservationConfirmationPage({super.key});

  @override
  State<ReservationConfirmationPage> createState() => _ReservationConfirmationPageState();
}

class _ReservationConfirmationPageState extends State<ReservationConfirmationPage> {
  int? roomId;
  String? roomType;
  String? startDate;
  String? endDate;
  int? jumlahDewasa;
  int? jumlahAnak;
  String? nomorRekening;
  String? pilihanKasur;
  int? price;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    roomId = args['roomId'];
    roomType = args['roomTypeName'];
    startDate = args['startDate'];
    endDate = args['endDate'];
    price = args['price'];
    jumlahDewasa = args['jumlahDewasa'];
    jumlahAnak = args['jumlahAnak'];
    nomorRekening = args['nomorRekening'];
    pilihanKasur = args['pilihanKasur'];
    price = args['price'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Success Reservation",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Do you want to add Paid Facilities?'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, AddPaidFacilitiesPage.ROUTE_NAME,
                    arguments: {
                      'roomId': roomId,
                      'roomTypeName': roomType,
                      'startDate': startDate,
                      'endDate': endDate,
                      'jumlahDewasa': jumlahDewasa,
                      'jumlahAnak': jumlahAnak,
                      'nomorRekening': nomorRekening,
                      'pilihanKasur': pilihanKasur,
                      'price': price,
                    });
              },
              child: Text('Yes'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, CheckoutConfirmationPage.ROUTE_NAME,
                    arguments: {
                      'roomId': roomId,
                      'roomTypeName': roomType,
                      'startDate': startDate,
                      'endDate': endDate,
                      'jumlahDewasa': jumlahDewasa,
                      'jumlahAnak': jumlahAnak,
                      'nomorRekening': nomorRekening,
                      'pilihanKasur': pilihanKasur,
                      'price': price,
                    });
              },
              child: Text('No'),
            ),
          ],
        ),
      ),
    );
  }
}
