import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/paid_facilities/get_paid_facilities/get_paid_facilities_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/reservation/add_reservation/add_reservation_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/customer/room/get_room_detail/get_room_detail_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/reservation_confirmation_page.dart';

import '../../../../domain/entities/paid_facilities/get_paid_facilities.dart';

class AddReservationPage extends StatefulWidget {
  static const ROUTE_NAME = "add_reservation_page";

  const AddReservationPage({super.key});

  @override
  State<AddReservationPage> createState() => _AddReservationPageState();
}

class _AddReservationPageState extends State<AddReservationPage> {
  int? roomId;
  int? roomTypeId;
  String? startDate;
  String? endDate;
  String? roomType;
  List<String> bedTypeArray = [];
  int? price;
  String? pilihanKasur;
  bool isButtonDisabled = true;

  TextEditingController jumlahDewasa = TextEditingController();
  TextEditingController jumlahAnak = TextEditingController();
  TextEditingController nomorRekeningController = TextEditingController();

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    roomId = args['roomId'];
    roomTypeId = args['roomTypeId'];
    roomType = args['roomTypeName'];
    startDate = args['startDate'];
    endDate = args['endDate'];
    price = args['price'];
    bedTypeArray = args['bedType']!.split(' atau ');
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
            'Add Reservation',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormBuilder(
                key: _formKey,
                child: ListView(children: [
                  ListTile(
                      title: Text("Room Type"),
                      subtitle: Text(
                        "$roomType",
                      ),
                      trailing: Icon(Icons.calendar_today)),
                  ListTile(
                    title: Text("Start Date"),
                    subtitle: Text(
                      "$startDate",
                    ),
                    trailing: Icon(Icons.calendar_today),
                  ),
                  ListTile(
                    title: Text("End Date"),
                    subtitle: Text(
                      "$endDate",
                    ),
                    trailing: Icon(Icons.calendar_today),
                  ),
                  FormBuilderTextField(
                    name: "jumlah_dewasa",
                    controller: jumlahDewasa,
                    decoration: InputDecoration(
                      hintText: 'Jumlah Dewasa',
                      label: Text('Jumlah Dewasa'),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormBuilderTextField(
                    name: "jumlah_anak",
                    controller: jumlahAnak,
                    decoration: InputDecoration(
                      hintText: 'Jumlah Anak',
                      label: Text('Jumlah Anak'),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  FormBuilderTextField(
                    name: "nomor_rekening",
                    controller: nomorRekeningController,
                    decoration: InputDecoration(
                      hintText: 'Nomor Rekening',
                      label: Text('Nomor Rekening'),
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue, width: 2.0),
                      ),
                    ),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                        FormBuilderValidators.numeric(),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  DropdownButtonFormField<String>(
                    hint: Text("Pilihan Kasur"),
                    value: pilihanKasur,
                    items: bedTypeArray.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    validator: FormBuilderValidators.compose(
                      [
                        FormBuilderValidators.required(),
                      ],
                    ),
                    onChanged: (value) {
                      setState(() {
                        pilihanKasur = value;
                      });
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.saveAndValidate() ?? false) {
                          if (true) {
                            Navigator.pushNamed(context, ReservationConfirmationPage.ROUTE_NAME, arguments: {
                              "roomId": roomId,
                              "roomTypeName" : roomType,
                              "startDate": startDate,
                              "endDate": endDate,
                              "jumlahDewasa": int.parse(jumlahDewasa.text),
                              "jumlahAnak": int.parse(jumlahAnak.text),
                              "nomorRekening": nomorRekeningController.text,
                              "pilihanKasur": pilihanKasur,
                              "price" : int.parse(price.toString())
                            });
                          }
                        }
                      },
                      child: Text("Konfirmasi pesanan")),
                ]))));
  }
}

class ArgumentPaidFacilities {
  late String name;
  late int id;
  late int unitCount;

  ArgumentPaidFacilities(this.name, this.id, this.unitCount);
}
// Widget buildFasilitasTambahanField(int index) {
//   var value = paidFacilities.first.id;
//   return Column(
//     children: [
//       DropdownButton<String>(
//         hint: Text("Nama fasilitas"),
//         items: paidFacilities.map((e) {
//           return DropdownMenuItem<String>(
//             value: e.id.toString(),
//             child: Text(e.namaFasilitas),
//           );
//         }).toList(),
//         onChanged: (value) {
//           setState(() {
//             selectedFacilities[value!] = 0; // Nilai awal jumlah unit adalah 0
//           });
//         },
//       ),
//       SizedBox(
//         height: 20,
//       ),
//       FormBuilderTextField(
//         name: "jumlah_unit_$index",
//         keyboardType: TextInputType.number,
//         decoration: InputDecoration(
//           hintText: 'Jumlah Unit',
//           label: Text("Jumlah Unit"),
//           border: OutlineInputBorder(),
//           focusedBorder: OutlineInputBorder(
//             borderSide: BorderSide(color: Colors.blue, width: 2.0),
//           ),
//         ),
//         onChanged: (value) {
//           if (selectedFacilities.isNotEmpty) {
//             selectedFacilities[selectedFacilities.keys.last] =
//                 int.tryParse(value!) ?? 0;
//           }
//         },
//         validator: FormBuilderValidators.compose(
//           [
//             FormBuilderValidators.required(),
//             FormBuilderValidators.numeric(),
//           ],
//         ),
//       )
//     ],
//   );
// }
//
// String getFacilityName(int id){
//   String name = "";
//   paidFacilities.forEach((element) {
//     if(element.id == id){
//       name = element.namaFasilitas;
//     }
//   });
//   return name;
// }
