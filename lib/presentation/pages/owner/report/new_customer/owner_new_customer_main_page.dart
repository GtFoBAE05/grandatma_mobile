import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grandatma_mobile/presentation/bloc/owner/report/new_customer/new_customer_bloc.dart';
import 'package:grandatma_mobile/presentation/pages/owner/report/new_customer/owner_new_customer_pdf_preview_page.dart';

class OwnerNewCustomerReportMainPage extends StatefulWidget {
  static const ROUTE_NAME = '/owner_new_customer_report_main_page';

  const OwnerNewCustomerReportMainPage({super.key});

  @override
  State<OwnerNewCustomerReportMainPage> createState() =>
      _OwnerNewCustomerReportMainPageState();
}

class _OwnerNewCustomerReportMainPageState
    extends State<OwnerNewCustomerReportMainPage> {
  DateTime _selectedDate = DateTime.now();
  int nomor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Grandatma New Customer Report',
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
                      .read<NewCustomerBloc>()
                      .add(fetchNewCustomer(_selectedDate.year.toString()));
                },
                child: Text("Search"),
              ),
              onTap: _showYearPicker,
            ),
            Expanded(
              child: BlocBuilder<NewCustomerBloc, NewCustomerState>(
                builder: (context, state) {
                  if (state is NewCustomerLoading) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is NewCustomerInitial) {
                    return Center(
                      child: Text("Please select year"),
                    );
                  } else if (state is NewCustomerSuccess) {
                    return Column(children: [
                      Table(
                        border: TableBorder.all(color: Colors.black),
                        children: [
                          TableRow(children: [
                            Center(child: Text("No")),
                            Center(child: Text("Bulan")),
                            Center(child: Text("Jumlah")),
                          ]),
                          ...state.newCustomers[0].entries
                              .toList()
                              .map((entry) {
                            final currentNomor = nomor++;
                            return TableRow(children: [
                              currentNomor == 13
                                  ? Text("")
                                  : Center(
                                      child: Text(currentNomor.toString())),
                              Center(child: Text(entry.key.toString())),
                              Center(child: Text(entry.value.toString())),
                            ]);
                          }),
                        ],
                      ),
                      Center(
                        child:
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, OwnerNewCustomerPdfPreviewPage.ROUTE_NAME,arguments: {
                              "data" : state.newCustomers,
                              "year" : _selectedDate.year
                            });
                          },
                          child: Text("To PDF"),
                        ),
                      )
                    ]);
                  } else if (state is NewCustomerError) {
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
