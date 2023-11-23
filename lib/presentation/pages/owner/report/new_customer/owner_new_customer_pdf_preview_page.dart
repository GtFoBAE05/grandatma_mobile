import 'dart:typed_data';
import 'package:intl/intl.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:printing/printing.dart';
import '../../../../../domain/entities/report/top_customer_report.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

class OwnerNewCustomerPdfPreviewPage extends StatefulWidget {
  static const ROUTE_NAME = '/owner_new_customer_pdf_preview_page';

  const OwnerNewCustomerPdfPreviewPage({super.key});

  @override
  State<OwnerNewCustomerPdfPreviewPage> createState() => _OwnerNewCustomerPdfPreviewPageState();
}

class _OwnerNewCustomerPdfPreviewPageState extends State<OwnerNewCustomerPdfPreviewPage> {
  late List<Map<String, int>> newCustomerData;
  int nomor = 1;
  late int year;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    newCustomerData = args["data"];
    year = args["year"];
  }

  @override
  Widget build(BuildContext context) {
    print(newCustomerData);
    return Scaffold(
      appBar: AppBar(
        title: Text('PDF Preview'),
      ),
      body: PdfPreview(
        build: (context) => makePdf(),
      ),
    );
  }

  Future<Uint8List> makePdf() async {
    final pdf = pw.Document();
    final imageLogo = pw.MemoryImage(
        (await rootBundle.load('assets/grandatmalogo.jpg'))
            .buffer
            .asUint8List());
    pdf.addPage(pw.Page(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(children: [
            pw.Image(
              imageLogo,
            ),
            pw.Center(
                child: pw.Text(
                    "Jl. P. Mangkubumi No.18, Yogyakarta 55233 Telp. (0274) 487711")),
            pw.Divider(height: 2, thickness: 2),
            pw.Center(child: pw.Text("Laporan Customer Baru")),
            pw.Container(
              alignment: pw.Alignment.centerLeft,
              child: pw.Text(
                  "Dicetak: ${DateFormat('d MMMM yyyy', 'id_ID').format(DateTime.now())}"),
            ),
            pw.Table(
              border: pw.TableBorder.all(color: PdfColor(0, 0, 0)),
              children: [
                pw.TableRow(children: [
                  pw.Center(child: pw.Text("No")),
                  pw.Center(child: pw.Text("Bulan")),
                  pw.Center(child: pw.Text("Jumlah")),
                ]),
                ...newCustomerData[0].entries.toList().map((entry) {
                  final currentNomor = nomor++;
                  return pw.TableRow(children: [
                    currentNomor == 13
                        ? pw.Text("")
                        : pw.Center(child: pw.Text(currentNomor.toString())),
                    pw.Center(child: pw.Text(entry.key.toString())),
                    pw.Center(child: pw.Text(entry.value.toString())),
                  ]);
                }),
              ],
            ),
            pw.Container(
              alignment: pw.Alignment.centerRight,
              child: pw.Text(
                  "Dicetak: ${DateFormat('d MMMM yyyy', 'id_ID').format(DateTime.now())}"),
            ),
          ]);
        })); //
    return pdf.save();
  }
}
