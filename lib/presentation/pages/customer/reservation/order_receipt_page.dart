import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/common/date_converter.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/detail/transaction_detail_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/customer/customer_main_page.dart';

class OrderReceiptPage extends StatefulWidget {
  static const ROUTE_NAME = "/order_receipt_page";

  const OrderReceiptPage({super.key});

  @override
  State<OrderReceiptPage> createState() => _OrderReceiptPageState();
}

class _OrderReceiptPageState extends State<OrderReceiptPage> {
  String? reservationId;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    reservationId = args['idReservation'];
    context
        .read<TransactionDetailBloc>()
        .add(GetTransactionDetail(id: reservationId.toString()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Receipt page',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<TransactionDetailBloc, TransactionDetailState>(
          builder: (context, state) {
        if (state is TransactionDetailInitial ||
            state is TransactionDetailLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionDetailSuccess) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),
                  Text(
                    'ID Booking: ${reservationId}',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Tanggal: ' + DateConverterWithoutTime(state.transactionDetail.data?.tanggalTransaksi ?? DateTime.now()),
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Nama: ${state.transactionDetail.user.nama}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Alamat: ${state.transactionDetail.user.alamat}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 24),
                  Text(
                    'DETAIL PEMESANAN',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 24),
                  Text('Check In: ' + DateConverterWithoutTime(state.transactionDetail.data?.tanggalCheckin ?? DateTime.now())),
                  SizedBox(height: 8),
                  Text('Check Out: ' + DateConverterWithoutTime(state.transactionDetail.data?.tanggalCheckout ?? DateTime.now())),
                  SizedBox(height: 8),
                  Text('Dewasa: ${state.transactionDetail.data?.jumlahDewasa} Orang'),
                  SizedBox(height: 8),
                  Text('Anak-anak: ${state.transactionDetail.data?.jumlahAnak} Anak'),
                  SizedBox(height: 8),
                  Text('Tanggal Pembayaran: ' + DateConverterWithoutTime(state.transactionDetail.data?.tanggalTransaksi ?? DateTime.now())),
                  SizedBox(height: 24),
                  Text(
                    'Jenis Kamar',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  Card(
                    elevation: 3,
                    child: ListTile(
                      title: Text('${state.transactionDetail.data?.tipeKamar}'),
                      subtitle: Text('Bed: ${state.transactionDetail.data?.pilihanKasur}'),
                      trailing: Text('Rp${state.transactionDetail.tarif}'),
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Total: Rp" + (state.transactionDetail.tarif * state.transactionDetail.days).toString(),
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Permintaan Khusus:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  SizedBox(height: 8),
                  for (var i in state.transactionDetail.fasilitas ?? [])
                    ListTile(
                      leading: Icon(Icons.arrow_right),
                      title: Text('${i.jumlahUnit}- ${i.namaFasilitas}'),
                    ),
                  ElevatedButton(onPressed: (){
                    Navigator.of(context).pushReplacementNamed(CustomerMainPage.ROUTE_NAME);
            }, child: Text("Back to Main Menu"))
                ],
              ),
            ),
          );

        } else if (state is TransactionDetailError) {
          return Center(
            child: Text(
              state.message,
            ),
          );
        } else {
          return Center(
            child: Text(
              "Unknown state",
            ),
          );
        }
      }),
    );
  }
}
