
import 'package:equatable/equatable.dart';


class TransactionDetail extends Equatable {
  TransactionDetail({
    required this.data,
    required this.fasilitas,
  });

  final TransactionDetailData? data;
  final List<Fasilitas> fasilitas;



  @override
  List<Object?> get props => [
    data,  fasilitas, ];

}

class TransactionDetailData extends Equatable {
  TransactionDetailData({
    required this.idReservasi,
    required this.tanggalTransaksi,
    required this.totalPembayaran,
    required this.nomorKamar,
    required this.tanggalCheckin,
    required this.tanggalCheckout,
    required this.jumlahDewasa,
    required this.jumlahAnak,
    required this.nomorRekening,
    required this.pilihanKasur,
    required this.statusBatal,
  });

  final String idReservasi;
  final DateTime? tanggalTransaksi;
  final int totalPembayaran;
  final int nomorKamar;
  final DateTime? tanggalCheckin;
  final DateTime? tanggalCheckout;
  final int jumlahDewasa;
  final int jumlahAnak;
  final String nomorRekening;
  final String pilihanKasur;
  final bool statusBatal;



  @override
  List<Object?> get props => [
    idReservasi, tanggalTransaksi, totalPembayaran, nomorKamar, tanggalCheckin, tanggalCheckout, jumlahDewasa, jumlahAnak, nomorRekening, pilihanKasur, statusBatal, ];

}


class Fasilitas extends Equatable {
  Fasilitas({
    required this.id,
    required this.idReservasi,
    required this.namaFasilitas,
    required this.jumlahUnit,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String idReservasi;
  final String namaFasilitas;
  final int jumlahUnit;
  final DateTime? createdAt;
  final DateTime? updatedAt;


  @override
  List<Object?> get props => [
    id, idReservasi, namaFasilitas, jumlahUnit, createdAt, updatedAt, ];

}