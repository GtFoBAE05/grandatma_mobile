

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/common/date_converter.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/history/transaction_history_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/customer/transaction/transaction_detail_page.dart';

import '../../../../domain/entities/transaction/transaction_history.dart';

class CustomerTransactionHistoryPage extends StatefulWidget {
  static const ROUTE_NAME = "/customer_transaction_history_page";
  const CustomerTransactionHistoryPage({super.key});

  @override
  State<CustomerTransactionHistoryPage> createState() => _TransactionHistoryPageState();
}

class _TransactionHistoryPageState extends State<CustomerTransactionHistoryPage>{


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("build");
    Future.microtask(() => context.read<TransactionHistoryBloc>().add(GetTransactionHistory()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Transaction History',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<TransactionHistoryBloc, TransactionHistoryState>(
        builder: (context, state) {
          if (state is TransactionHistoryInitial || state is TransactionHistoryLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is TransactionHistorySuccess) {
            if (state.transactionHistory.isEmpty) {
              return Center(
                child: Text("No Transaction History"),
              );
            } else {
              return ListView.builder(
                itemCount: state.transactionHistory.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 4,
                    margin: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      title: Text(
                        DateConverter(state.transactionHistory[index].tanggalTransaksi ?? DateTime.now()),
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Total Pembayaran: Rp${state.transactionHistory[index].totalPembayaran.toString()}",
                        style: TextStyle(
                          fontSize: 14,
                        ),
                      ),trailing: Icon(Icons.arrow_forward_ios),
                      onTap: (){
                        Navigator.pushNamed(context, CustomerTransactionDetailPage.ROUTE_NAME, arguments: {
                          'id' : state.transactionHistory[index].idReservasi
                        });
                      },
                    ),
                  );
                },
              );
            }
          } else if (state is TransactionHistoryError) {
            return Center(
              child: Text(
                state.message,
                style: TextStyle(color: Colors.red),
              ),
            );
          } else {
            return Center(
              child: Text("Unknown Error"),
            );
          }
        },
      ),
    );

  }
}
