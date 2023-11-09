
import 'package:equatable/equatable.dart';


class TransactionDetail extends Equatable {
  TransactionDetail({
    required this.data,
    required this.fasilitas,
    required this.user,
    required this.tarif,
    required this.days
  });

  final TransactionDetailData? data;
  final List<Fasilitas> fasilitas;
  final TransactionUser user;
  final int days;
  final int tarif;


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
    required this.tipeKamar,
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
  final String tipeKamar;
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

class TransactionUser extends Equatable {
  TransactionUser({
    required this.id,
    required this.nama,
    required this.email,
    required this.username,
    required this.notelp,
    required this.password,
    required this.alamat,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String nama;
  final String email;
  final String username;
  final String notelp;
  final String password;
  final String alamat;
  final String role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
    id, nama, email, username, notelp, password, alamat, role, createdAt, updatedAt, ];

}