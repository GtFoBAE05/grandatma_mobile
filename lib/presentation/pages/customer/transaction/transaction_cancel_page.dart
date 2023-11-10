import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/common/date_converter.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/do_cancel_transaction/do_cancel_transaction_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/transaction/search_transaction_can_cancel/search_transaction_can_cancel_bloc.dart';

import '../../../../domain/entities/transaction/transaction_can_cancel.dart';

class TransactionCancelPage extends StatefulWidget {
  static const ROUTE_NAME = '/customer_transaction_cancel_page';

  const TransactionCancelPage({super.key});

  @override
  State<TransactionCancelPage> createState() => _TransactionCancelPageState();
}

class _TransactionCancelPageState extends State<TransactionCancelPage> {
  List<TransactionCanCancel> listTransaction = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context
        .read<SearchTransactionCanCancelBloc>()
        .add(SearchTransactionCanCancel(id: ""));
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
        body: BlocListener<DoCancelTransactionBloc, DoCancelTransactionState>(
          listener: (context, state) {
            if (state is DoCancelTransactionSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Cancel Success"),
                  backgroundColor: Colors.green,
                ),
              );
              context.read<SearchTransactionCanCancelBloc>().add(
                  SearchTransactionCanCancel(id: ""));
            } else if (state is DoCancelTransactionError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Cancel Failed: ${state.message}"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: Container(
            padding: EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(children: [
                TextField(
                  // onChanged: (value) {
                  //   context.read<SearchTransactionCanCancelBloc>().add(SearchTransactionCanCancel(id: value));
                  // },
                  onSubmitted: (value) {
                    context
                        .read<SearchTransactionCanCancelBloc>()
                        .add(SearchTransactionCanCancel(id: value));
                  },
                  decoration: const InputDecoration(
                      labelText: 'Search', suffixIcon: Icon(Icons.search)),
                ),
                BlocBuilder<SearchTransactionCanCancelBloc,
                    SearchTransactionCanCancelState>(
                  builder: (context, state) {
                    if (state is SearchTransactionCanCancelInitial ||
                        state is SearchTransactionCanCancelLoading) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is SearchTransactionCanCancelSuccess) {
                      listTransaction = state.listTransaction;
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: listTransaction.length,
                        itemBuilder: (context, index) {
                          final transaction = listTransaction[index];
                          return Card(
                            child: ListTile(
                              title: Text("${transaction
                                  .idReservasi} / Tanggal Transaksi: ${DateConverterWithoutTime(
                                  transaction.tanggalTransaksi ??
                                      DateTime.now())}"),
                              subtitle:
                              Text("Tanggal checkin: ${DateConverterWithoutTime(
                                  transaction.tanggalCheckin ??
                                      DateTime.now())}"),
                              onTap: () {
                                Duration? dateDiff = transaction.tanggalCheckin
                                    ?.difference(DateTime.now());

                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return AlertDialog(
                                          title: const Text(
                                              'Cancel Reservation'),
                                          content: dateDiff!.inDays < 7 ? Text(
                                              'Are you sure want to cancel reservation? ${dateDiff
                                                  ?.inDays} days left. Funds will not be refunded.') : Text(
                                              'Are you sure want to cancel reservation? ${dateDiff
                                                  ?.inDays} days left. The refund will be issued.'),
                                          actions: [
                                      TextButton(
                                      onPressed: Navigator.of(context).pop,
                                      child: const Text('No'),
                                      ),
                                      TextButton(
                                      onPressed: () {
                                      context.read<DoCancelTransactionBloc>().add(DoCancelTransaction(id: transaction.idReservasi));
                                      Navigator.of(context).pop();
                                      },
                                      child: const Text('Ok'),
                                      )
                                      ,
                                      ]
                                      ,
                                      );
                                    });
                              },
                            ),
                          );
                        },
                      );
                    } else if (state is SearchTransactionCanCancelError) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else {
                      return Container();
                    }
                  },
                )
              ]),
            ),
          ),
        ));
  }
}
