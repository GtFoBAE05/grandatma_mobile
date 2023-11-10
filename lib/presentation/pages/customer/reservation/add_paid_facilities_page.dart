import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:grandatma_mobile/domain/entities/paid_facilities/get_paid_facilities.dart';
import 'package:grandatma_mobile/presentation/pages/customer/home/customer_home_page.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/paid_facilities_confirmation_page.dart';

import '../../../bloc/customer/paid_facilities/get_paid_facilities/get_paid_facilities_bloc.dart';
import '../../../bloc/customer/paid_facilities/reserve_paid_facilities/reserve_paid_facilities_bloc.dart';
import 'add_reservation_page.dart';

class AddPaidFacilitiesPage extends StatefulWidget {
  static const ROUTE_NAME = "/add_paid_facilities_page";

  const AddPaidFacilitiesPage({super.key});

  @override
  State<AddPaidFacilitiesPage> createState() => _AddPaidFacilitiesPageState();
}

class _AddPaidFacilitiesPageState extends State<AddPaidFacilitiesPage> {
  final _formKey = GlobalKey<FormBuilderState>();

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

  var paidFacilitiesId;
  var paidFacilitiesName;
  var paidFacilitiesUnit;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<GetPaidFacilitiesBloc>().add(GetPaidFacilities());
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute
        .of(context)!
        .settings
        .arguments as Map;
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
    argumentPaidFacilities = args['paidFacilities'] == null ? [] : args['paidFacilities'];
    print("addpaidfacilities");
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
        title: Text(
          "Add Paid Facilities",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: BlocListener<ReservePaidFacilitiesBloc, ReservePaidFacilitiesState>(
        listener: (context, state) {
          if (state is ReservePaidFacilitiesSuccess) {
            Navigator.pushReplacementNamed(
                context, PaidFacilitiesConfirmationPage.ROUTE_NAME);
          }
        },
        child: BlocBuilder<GetPaidFacilitiesBloc, GetPaidFacilitiesState>(
          builder: (context, state) {
            if (state is GetPaidFacilitiesInitial ||
                state is GetPaidFacilitiesLoading) {
              return Center(child: CircularProgressIndicator());
            } else if (state is GetPaidFacilitiesSuccess) {
              List<PaidFacilities> paidFacilities = state.paidFacilities;
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: FormBuilder(
                  key: _formKey,
                  child: Center(
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            DropdownButtonFormField<String>(
                              hint: Text("Pilihan fasilitas"),
                              value: paidFacilitiesId,
                              items: paidFacilities.map((e) {
                                return DropdownMenuItem<String>(
                                  value: e.id.toString(),
                                  child: Text(e.namaFasilitas.toString()),
                                );
                              }).toList(),
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(),
                                ],
                              ),
                              onChanged: (value) {
                                setState(() {
                                  paidFacilitiesId = value;
                                  paidFacilitiesName = paidFacilities
                                      .firstWhere((element) => element.id == int.parse(value!)).namaFasilitas;
                                });
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            FormBuilderTextField(
                              name: "jumlah_unit",
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: 'Jumlah Unit',
                                label: Text("Jumlah Unit"),
                                border: OutlineInputBorder(),
                                focusedBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.blue, width: 2.0),
                                ),
                              ),
                              onChanged: (value) {
                                setState(() {
                                  paidFacilitiesUnit = value;
                                });
                              },
                              validator: FormBuilderValidators.compose(
                                [
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.numeric(),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState
                                    ?.saveAndValidate() ??
                                    false) {
                                  if (true) {
                                    argumentPaidFacilities?.add(ArgumentPaidFacilities(
                                        paidFacilitiesName.toString(), int.parse(paidFacilitiesId),
                                        int.parse(paidFacilitiesUnit)));

                                    print(argumentPaidFacilities);
                                    Navigator.pushReplacementNamed(
                                        context,
                                        PaidFacilitiesConfirmationPage.ROUTE_NAME,
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
                                          'paidFacilities': argumentPaidFacilities,
                                        });
                                  }
                                }
                              },
                              child: Text('Add Paid Facilities'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else if (state is GetPaidFacilitiesError) {
              return Center(child: Text(state.message));
            } else {
              return Center(child: Text('Unknown Error'));
            }
          },
        ),
      ),
    );
  }
}
