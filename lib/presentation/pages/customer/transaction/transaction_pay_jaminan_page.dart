import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../../../bloc/customer/jaminan/get_jaminan/get_jaminan_bloc.dart';
import '../../../bloc/customer/jaminan/pay_jaminan/pay_jaminan_bloc.dart';

class TransactionPayJaminanPage extends StatefulWidget {
  static const ROUTE_NAME = "/customer_transaction_pay_jaminan_page";

  const TransactionPayJaminanPage({super.key});

  @override
  State<TransactionPayJaminanPage> createState() =>
      _TransactionPayJaminanPageState();
}

class _TransactionPayJaminanPageState extends State<TransactionPayJaminanPage> {

  String? idReservasi;
  int? totalBayar;
  TextEditingController jaminanController = TextEditingController();
  TextEditingController nomorRekeningController = TextEditingController();
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map;
    idReservasi = args['idReservation'];
    totalBayar = args['totalPayment'];
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
                Navigator.of(context).pop();
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
            }, child: BlocBuilder<PayJaminanBloc, PayJaminanState>(
          builder: (context, state) {
            if (state is PayJaminanLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is PayJaminanSuccess) {
              return Center(
                child: Text("Success pay reservation"),
              );
            } else if (state is PayJaminanError) {
              return Center(
                child: Text(state.message),
              );
            } else {
              return Scaffold(
                  body: FormBuilder(
                      key: _formKey,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ListView(
                          children: [
                            ListTile(
                              title: Text("Id Reservasi"),
                              subtitle: Text("$idReservasi"),
                            ),
                            ListTile(
                              title: Text("Total bayar"),
                              subtitle: Text("$totalBayar"),
                            ),
                            FormBuilderTextField(
                              name: "Uang yang akan dibayarkan",
                              controller: jaminanController,
                              decoration: InputDecoration(
                                hintText: 'Uang yang akan dibayarkan',
                                label: Text('Uang yang akan dibayarkan'),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                                ),
                              ),
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.numeric(),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            FormBuilderTextField(
                              name: "nomor_rekening",
                              controller: nomorRekeningController,
                              decoration: InputDecoration(
                                hintText: 'Nomor Rekening',
                                label: Text('Nomor Rekening'),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                                ),
                              ),
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.numeric(),
                                ],
                              ),
                            ),
                            SizedBox(height: 20),
                            ElevatedButton(onPressed: () {
                              if (_formKey.currentState?.saveAndValidate() ??
                                  false) {
                                if (true) {
                                  if (int.parse(jaminanController.text) != totalBayar) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                            "Uang yang dibayarkan tidak sesuai"),
                                        backgroundColor: Colors.red,
                                      ),
                                    );
                                  } else {
                                    context.read<PayJaminanBloc>().add(
                                        DoPayJaminan(idReservasi.toString(),
                                            totalBayar!.toInt(),
                                            nomorRekeningController.text));
                                    context.read<GetJaminanBloc>().add(GetJaminan());

                                  }
                                }
                              }
                            }, child: Text("Pay"))
                          ],
                        ),
                      )

                  )
              );
            }
          },
        )));
  }
}
