import 'package:equatable/equatable.dart';

class TransactionCanCancel extends Equatable {
  TransactionCanCancel({
    required this.nama,
    required this.idReservasi,
    required this.tanggalTransaksi,
    required this.tanggalCheckin,
    required this.totalPembayaran,
  });

  final String? nama;
  final String? idReservasi;
  final DateTime? tanggalTransaksi;
  final DateTime? tanggalCheckin;
  final int? totalPembayaran;


  @override
  List<Object?> get props => [
    nama, idReservasi, tanggalTransaksi, tanggalCheckin, totalPembayaran, ];

}
