
import 'package:equatable/equatable.dart';

class TransactionHistory extends Equatable {
  TransactionHistory({
    required this.idReservasi,
    required this.tanggalTransaksi,
    required this.totalPembayaran,
  });

  final String idReservasi;
  final DateTime? tanggalTransaksi;
  final int totalPembayaran;

  @override
  List<Object?> get props => [
    idReservasi, tanggalTransaksi, totalPembayaran, ];

}