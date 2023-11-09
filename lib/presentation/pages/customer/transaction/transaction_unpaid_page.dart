import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/jaminan/get_jaminan/get_jaminan_bloc.dart';

class TransactionUnpaidPage extends StatefulWidget {
  static const ROUTE_NAME = "/customer_transaction_unpaid_page";
  const TransactionUnpaidPage({super.key});

  @override
  State<TransactionUnpaidPage> createState() => _TransactionUnpaidPageState();
}

class _TransactionUnpaidPageState extends State<TransactionUnpaidPage> {
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
          "Unpaid Transaction",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocBuilder<GetJaminanBloc, GetJaminanState>
        (builder: (context, state) {
          if(state is GetJaminanInitial || state is GetJaminanLoading){
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetJaminanSuccess){
            return ListView.builder(
              itemCount: state.listJaminan.length,
              itemBuilder: (context, index) {
                final jaminan = state.listJaminan[index];
                  return Card(
                  child: ListTile(
                    title: Text("${jaminan.idReservasi}"),
                    subtitle: Text("Rp${jaminan.totalPembayaran}"),
                    trailing: Icon(Icons.attach_money),
                  ),
                );
              },
            );
          } else if(state is GetJaminanError){
            return Center(
              child: Text(state.message),
            );
          }else{
            return Center(
              child: Text("Unknown Error"),
            );
          }
        },)
    );
  }
}
