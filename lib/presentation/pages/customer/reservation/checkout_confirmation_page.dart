import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/common/date_converter.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/paid_facilities/reserve_paid_facilities/reserve_paid_facilities_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/reservation/add_reservation/add_reservation_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/add_reservation_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/order_receipt_page.dart';

class CheckoutConfirmationPage extends StatefulWidget {
  static const ROUTE_NAME = "/checkout_confirmation_page";

  const CheckoutConfirmationPage({super.key});

  @override
  State<CheckoutConfirmationPage> createState() =>
      _CheckoutConfirmationPageState();
}

class _CheckoutConfirmationPageState extends State<CheckoutConfirmationPage> {
  int? roomId;
  String? roomType;
  String? startDate;
  String? endDate;
  int? jumlahDewasa;
  int? jumlahAnak;
  String? nomorRekening;
  String? pilihanKasur;
  int? price;
  List<ArgumentPaidFacilities> facilities = [];

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
    facilities = args['paidFacilities'] == null ? [] : args['paidFacilities'];
    facilities.forEach((element) {
      print("---------------");
      print("id: ${element.id}");
      print("name: ${element.name}");
      print("unitCount: ${element.unitCount}");
    });
    print("---------------");
    print(roomId);
    print(roomType);
    print(startDate);
    print(endDate);
    print(price);
    print(jumlahDewasa);
    print(jumlahAnak);
    print(nomorRekening);
    print(pilihanKasur);
    print(price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Resume Pemesanan'),
      ),
      body: BlocListener<AddReservationBloc, AddReservationState>(
        listener: (context, state) {
          if (state is AddReservationSuccess) {
            if (facilities.isEmpty || facilities == null) {
              Navigator.pushReplacementNamed(
                  context, OrderReceiptPage.ROUTE_NAME,
                  arguments: {
                    'idReservation': state.idReservasi,
                  });
            } else {
              String idReservasi = state.idReservasi.toString();
              context.read<ReservePaidFacilitiesBloc>().add(
                  DoMultipleReservePaidFacilities(
                      paidFacilities: facilities, idReservasi: idReservasi));
              Navigator.pushReplacementNamed(
                  context, OrderReceiptPage.ROUTE_NAME,
                  arguments: {
                    'idReservation': state.idReservasi,
                  });

              if (context.read<ReservePaidFacilitiesBloc>().state
                  is ReservePaidFacilitiesSuccess) {
                Navigator.pushReplacementNamed(
                    context, OrderReceiptPage.ROUTE_NAME,
                    arguments: {
                      'idReservation': state.idReservasi,
                    });
              }
              BlocListener<ReservePaidFacilitiesBloc,
                  ReservePaidFacilitiesState>(
                listener: (context, state) {
                  if (state is ReservePaidFacilitiesSuccess) {
                    Navigator.pushReplacementNamed(
                        context, OrderReceiptPage.ROUTE_NAME,
                        arguments: {
                          'idReservation': idReservasi,
                        });
                  }
                },
              );
              // facilities.forEach((element) {
              //   context.read<ReservePaidFacilitiesBloc>().add(
              //       DoReservePaidFacilities(
              //           idReservasi: state.idReservasi.toString(),
              //           paidFacilityId: element.id.toInt(),
              //           jumlahUnit: element.unitCount.toInt()));
              // });
              // if(context.read<ReservePaidFacilitiesBloc>().state is ReservePaidFacilitiesSuccess){
              //   Navigator.pushReplacementNamed(context, OrderReceiptPage.ROUTE_NAME,
              //       arguments: {
              //         'idReservation': state.idReservasi,
              //       });
              // }
            }
          } else if (state is AddReservationError) {
            print(state.message);
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: BlocBuilder<AddReservationBloc, AddReservationState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Text(
                        //   'ID Transaksi: $transactionId',
                        //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        // ),
                        // SizedBox(height: 20),
                        Text(
                          'Total Pembayaran: Rp${price! * calculateDateDifference(startDate.toString(), endDate.toString()).inDays}',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Jumlah dewasa: $jumlahDewasa',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Jumlah anak: $jumlahAnak',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Nomor Rekening: $nomorRekening',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Kamar yang Dipesan: $roomType',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 20),
                        Text(
                          'Fasilitas yang Dipesan:',
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(height: 10),
                        if (facilities.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: facilities.map((entry) {
                              return Text('- ${entry.unitCount}: ${entry.name}',
                                  style: TextStyle(fontSize: 16));
                            }).toList(),
                          )
                        else
                          Text('Tidak ada fasilitas yang dipesan',
                              style: TextStyle(fontSize: 16)),

                        SizedBox(height: 20),
                        ElevatedButton(
                            onPressed: () {
                              context.read<AddReservationBloc>().add(DoAddReservation(
                                  idKamar: int.parse(roomId.toString()),
                                  tanggalCheckin: startDate.toString(),
                                  tanggalCheckout: endDate.toString(),
                                  jumlahDewasa: int.parse(jumlahDewasa.toString()),
                                  jumlahAnak: int.parse(jumlahAnak.toString()),
                                  nomorRekening: nomorRekening.toString(),
                                  pilihanKasur: pilihanKasur.toString()));
                            },
                            child: Text('Pesan Sekarang')),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
