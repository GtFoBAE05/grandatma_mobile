import 'package:flutter/material.dart';
import 'package:grandatma_mobile/domain/entities/paid_facilities/add_paid_facilities.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/add_paid_facilities_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/checkout_confirmation_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/order_receipt_page.dart';

import 'add_reservation_page.dart';

class PaidFacilitiesConfirmationPage extends StatefulWidget {
  static const ROUTE_NAME = "/paid_facilities_confirmation_page";
  const PaidFacilitiesConfirmationPage({super.key});

  @override
  State<PaidFacilitiesConfirmationPage> createState() => _PaidFacilitiesConfirmationPageState();
}

class _PaidFacilitiesConfirmationPageState extends State<PaidFacilitiesConfirmationPage> {
  int? roomId;
  String? roomType;
  String? startDate;
  String? endDate;
  int? jumlahDewasa;
  int? jumlahAnak;
  String? nomorRekening;
  String? pilihanKasur;
  int? price;
  List<ArgumentPaidFacilities>? argumentPaidFacilities;


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
    argumentPaidFacilities = args['paidFacilities'];
    print("confirmation paid");
    argumentPaidFacilities?.forEach((element) {
      print("---------------");
      print("id: ${element.id}");
      print("name: ${element.name}");
      print("unitCount: ${element.unitCount}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          "Paid Facilities",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: 50,
              height: 50,
            ),
            Text('Do you want to add More Paid Facilities?'),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, AddPaidFacilitiesPage.ROUTE_NAME, arguments: {
                  'roomId': roomId,
                  'roomTypeName': roomType,
                  'startDate': startDate,
                  'endDate': endDate,
                  'jumlahDewasa': jumlahDewasa,
                  'jumlahAnak': jumlahAnak,
                  'nomorRekening': nomorRekening,
                  'pilihanKasur': pilihanKasur,
                  'price': price,
                  'paidFacilities': argumentPaidFacilities,
                });
              },
              child: Text('Yes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, CheckoutConfirmationPage.ROUTE_NAME, arguments: {
                  'roomId': roomId,
                  'roomTypeName': roomType,
                  'startDate': startDate,
                  'endDate': endDate,
                  'jumlahDewasa': jumlahDewasa,
                  'jumlahAnak': jumlahAnak,
                  'nomorRekening': nomorRekening,
                  'pilihanKasur': pilihanKasur,
                  'price': price,
                  'paidFacilities': argumentPaidFacilities,
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
