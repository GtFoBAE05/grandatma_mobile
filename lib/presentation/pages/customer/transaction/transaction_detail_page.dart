import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/common/date_converter.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/detail/transaction_detail_bloc.dart';

class CustomerTransactionDetailPage extends StatefulWidget {
  static const ROUTE_NAME = "/customer_transaction_detail_page";

  const CustomerTransactionDetailPage({super.key});

  @override
  State<CustomerTransactionDetailPage> createState() =>
      _TransactionDetailPageState();
}

class _TransactionDetailPageState extends State<CustomerTransactionDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map;
    final id = args['id'];
    context.read<TransactionDetailBloc>().add(GetTransactionDetail(id: id));
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
          "Reservation Detail",
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
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildInfoTile('Id Reservasi',
                        state.transactionDetail.data!.idReservasi),
                    _buildInfoTile(
                        'Tanggal Transaksi',
                        DateConverter(
                            state.transactionDetail.data!.tanggalTransaksi ??
                                DateTime.now())),
                    _buildInfoTile('Total Pembayaran',
                        "Rp${state.transactionDetail.data!.totalPembayaran}"),
                    _buildInfoTile('Nomor Kamar',
                        state.transactionDetail.data!.nomorKamar.toString()),
                    _buildInfoTile(
                        'Tanggal Checkin',
                        DateConverter(
                            state.transactionDetail.data!.tanggalCheckin ??
                                DateTime.now())),
                    _buildInfoTile(
                        'Tanggal Checkout',
                        DateConverter(
                            state.transactionDetail.data!.tanggalCheckout ??
                                DateTime.now())),
                    _buildInfoTile('Jumlah Dewasa',
                        "${state.transactionDetail.data!.jumlahDewasa} dewasa"),
                    _buildInfoTile('Jumlah Anak',
                        "${state.transactionDetail.data!.jumlahDewasa} anak"),
                    _buildInfoTile('Nomor Rekening',
                        state.transactionDetail.data!.nomorRekening),
                    _buildInfoTile('Pilihan Kasur',
                        state.transactionDetail.data!.pilihanKasur),
                    _buildInfoTile(
                      'Status Transaksi',
                      state.transactionDetail.data!.statusBatal
                          ? "Batal"
                          : state.transactionDetail.data!.tanggalCheckin!
                          .isBefore(DateTime.now())
                          ? "Dalam proses"
                          : "Selesai",
                    ),
                    SizedBox(width: 40,),
                    Text('Fasilitas:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: state.transactionDetail.fasilitas.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 2,
                          margin: EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            title: Text(
                              state.transactionDetail.fasilitas[index].namaFasilitas,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              'Jumlah Unit: ${state.transactionDetail.fasilitas[index].jumlahUnit}',
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          } else if (state is TransactionDetailError) {
            return Center(
              child: Text(state.message),
            );
          } else {
            return Center(
              child: Text("ERR"),
            );
          }
        },
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
