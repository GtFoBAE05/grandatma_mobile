
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/domain/entities/report/top_customer_report.dart';
import 'package:grandatma_mobile/presentation/bloc/owner/report/top_customer/top_customer_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/owner/report/top_customer/owner_top_customer_pdf_preview_page.dart';



class OwnerTopCustomerPage extends StatefulWidget {
  static const ROUTE_NAME = '/owner_top_customer_page';

  const OwnerTopCustomerPage({super.key});

  @override
  State<OwnerTopCustomerPage> createState() => _OwnerTopCustomerPageState();
}

class _OwnerTopCustomerPageState extends State<OwnerTopCustomerPage> {
  DateTime _selectedDate = DateTime.now();
  int nomor = 1;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grandatma Top Customer Report',
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.white,
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                "Start Date",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: _selectedDate == null
                  ? Text("Select year")
                  : Text("Year: ${_selectedDate.year}"),
              trailing: TextButton(
                onPressed: () {
                  nomor = 1;
                  context
                      .read<TopCustomerBloc>()
                      .add(fetchTopCustomer(_selectedDate.year.toString()));
                },
                child: Text("Search"),
              ),
              onTap: _showYearPicker,
            ),
            Expanded(
              child: BlocBuilder<TopCustomerBloc, TopCustomerState>(
                builder: (context, state) {
                  if (state is TopCustomerLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is TopCustomerInitial) {
                    return Center(
                      child: Text("Please select year"),
                    );
                  } else if (state is TopCustomerSuccess) {
                    return Column(children: [
                      Table(
                        border: TableBorder.all(color: Colors.black),
                        children: [
                          TableRow(children: [
                            Center(child: Text("No")),
                            Center(child: Text("Nama Customer")),
                            Center(child: Text("Jumlah Reservasi")),
                            Center(child: Text("Total Pembayaran")),
                          ]),
                          ...state.topCustomers.map((entry) {
                            final currentNomor = nomor++;
                            return TableRow(children: [
                              currentNomor == 13
                                  ? Text("")
                                  : Center(
                                      child: Text(currentNomor.toString())),
                              Center(child: Text(entry.name.toString())),
                              Center(
                                  child:
                                      Text(entry.reservationCount.toString())),
                              Center(
                                  child: Text(
                                      "Rp${entry.totalPayment.toString()}")),
                            ]);
                          }),
                        ],
                      ),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, OwnerTopCustomerPdfPreviewPage.ROUTE_NAME, arguments: {
                              'data': state.topCustomers,
                              'year': _selectedDate.year
                            });
                          },
                          child: Text("To PDF"),
                        ),
                      )
                    ]);
                  } else if (state is TopCustomerError) {
                    return Center(
                      child: Text(
                        state.message,
                        style: TextStyle(
                            color: Colors.red), // Ganti warna sesuai selera
                      ),
                    );
                  } else {
                    return Center(
                      child: Text("Unknown state"),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showYearPicker() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Year"),
          content: Container(
            // Need to use container to add size constraint.
            width: 300,
            height: 300,
            child: YearPicker(
              firstDate: DateTime(DateTime.now().year - 100, 1),
              lastDate: DateTime(DateTime.now().year),
              initialDate: DateTime.now(),
              // save the selected date to _selectedDate DateTime variable.
              // It's used to set the previous selected date when
              // re-showing the dialog.
              selectedDate: _selectedDate,
              onChanged: (DateTime dateTime) {
                Navigator.pop(context);
                setState(() {
                  nomor = 1;
                  _selectedDate = dateTime;
                });
              },
            ),
          ),
        );
      },
    );
  }


}
