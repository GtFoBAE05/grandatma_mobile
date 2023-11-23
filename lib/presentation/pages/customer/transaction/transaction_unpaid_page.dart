import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/jaminan/get_jaminan/get_jaminan_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/jaminan/pay_jaminan/pay_jaminan_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/order_receipt_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/transaction/transaction_pay_jaminan_page.dart';

class TransactionUnpaidPage extends StatefulWidget {
  static const ROUTE_NAME = "/customer_transaction_unpaid_page";

  const TransactionUnpaidPage({super.key});

  @override
  State<TransactionUnpaidPage> createState() => _TransactionUnpaidPageState();
}

class _TransactionUnpaidPageState extends State<TransactionUnpaidPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetJaminanBloc>().add(GetJaminan());
  }

  @override
  Widget build(BuildContext context) {

    context.read<GetJaminanBloc>().add(GetJaminan());
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
            "Unpaid Transaction",
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: BlocListener<PayJaminanBloc, PayJaminanState>(
          listener: (context, state) {
            if (state is PayJaminanSuccess) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Success pay reservation"),
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is PayJaminanError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text("Failed pay reservation"),
                  backgroundColor: Colors.red,
                ),
              );
            }
          },
          child: BlocBuilder<GetJaminanBloc, GetJaminanState>(
            builder: (context, state) {
              if (state is GetJaminanInitial || state is GetJaminanLoading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetJaminanSuccess) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: state.listJaminan.length,
                    itemBuilder: (context, index) {
                      final jaminan = state.listJaminan[index];
                      return Card(
                        child: ListTile(
                            title:
                                Text("Reservation Id: ${jaminan.idReservasi}"),
                            subtitle: Text("Rp${jaminan.totalPembayaran}"),
                            trailing: Icon(Icons.attach_money),
                            leading: jaminan.statusLunas == true? Icon(Icons.check_circle, color: Colors.green,) : Icon(Icons.cancel, color: Colors.red,),
                            onTap: () {
                              if(jaminan.statusLunas == true){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text("Reservation already paid"),
                                    backgroundColor: Colors.red,
                                  ),
                                );
                                Navigator.of(context).pushNamed(OrderReceiptPage.ROUTE_NAME, arguments: {
                                  'idReservation': jaminan.idReservasi,
                                });
                                return;
                              }
                              Navigator.of(context).pushNamed(TransactionPayJaminanPage.ROUTE_NAME, arguments: {
                                'idReservation': jaminan.idReservasi,
                                'totalPayment': jaminan.totalPembayaran,
                              });
                              // showDialog(
                              //   context: context,
                              //   builder: (_) {
                              //     return AlertDialog(
                              //       title: const Text('Pay Reservation'),
                              //       content: const Text(
                              //           'Are you sure? The reservation amount will be the same as the total payment.'),
                              //       actions: [
                              //         TextButton(
                              //           onPressed: Navigator.of(context).pop,
                              //           child: const Text('Cancel'),
                              //         ),
                              //         TextButton(
                              //           onPressed: () {
                              //             context.read<PayJaminanBloc>().add(
                              //                 DoPayJaminan(
                              //                     jaminan.idReservasi
                              //                         .toString(),
                              //                     jaminan.totalPembayaran!
                              //                         .toInt()));
                              //             Navigator.of(context).pop();
                              //             context.read<GetJaminanBloc>().add(GetJaminan());
                              //           },
                              //           child: const Text('Ok'),
                              //         ),
                              //       ],
                              //     );
                              //   },
                              // );
                            }),
                      );
                    },
                  ),
                );
              } else if (state is GetJaminanError) {
                return Center(
                  child: Text(state.message),
                );
              } else {
                return Center(
                  child: Text("Unknown Error"),
                );
              }
            },
          ),
        ));
  }
}
