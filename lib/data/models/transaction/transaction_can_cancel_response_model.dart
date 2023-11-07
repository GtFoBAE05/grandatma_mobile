import 'package:equatable/equatable.dart';
import 'package:grandatma_mobile/domain/entities/transaction/transaction_can_cancel.dart';

class TransactionCanCancelResponseModel extends Equatable {
  TransactionCanCancelResponseModel({
    required this.data,
    required this.error,
  });

  final List<TransactionCanCancelModel> data;
  final bool error;

  factory TransactionCanCancelResponseModel.fromJson(Map<String, dynamic> json){
    return TransactionCanCancelResponseModel(
      data: json["data"] == null ? [] : List<TransactionCanCancelModel>.from(json["data"]!.map((x) => TransactionCanCancelModel.fromJson(x))),
      error: json["error"],
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data.map((x) => x?.toJson()).toList(),
    "error": error,
  };

  @override
  List<Object?> get props => [
    data, error, ];

}

class TransactionCanCancelModel extends Equatable {
  TransactionCanCancelModel({
    required this.nama,
    required this.idReservasi,
    required this.tanggalTransaksi,
    required this.tanggalCheckin,
    required this.totalPembayaran,
  });

  final String nama;
  final String idReservasi;
  final DateTime? tanggalTransaksi;
  final DateTime? tanggalCheckin;
  final int totalPembayaran;

  factory TransactionCanCancelModel.fromJson(Map<String, dynamic> json){
    return TransactionCanCancelModel(
      nama: json["Nama"],
      idReservasi: json["id_reservasi"],
      tanggalTransaksi: DateTime.tryParse(json["tanggal_transaksi"] ?? ""),
      tanggalCheckin: DateTime.tryParse(json["tanggal_checkin"] ?? ""),
      totalPembayaran: json["total_pembayaran"],
    );
  }

  Map<String, dynamic> toJson() => {
    "Nama": nama,
    "id_reservasi": idReservasi,
    "tanggal_transaksi": tanggalTransaksi?.toIso8601String(),
    "tanggal_checkin": tanggalCheckin?.toIso8601String(),
    "total_pembayaran": totalPembayaran,
  };

  TransactionCanCancel toEntity(){
    return TransactionCanCancel(
      nama: nama,
      idReservasi: idReservasi,
      tanggalTransaksi: tanggalTransaksi,
      tanggalCheckin: tanggalCheckin,
      totalPembayaran: totalPembayaran,
    );
  }

  @override
  List<Object?> get props => [
    nama, idReservasi, tanggalTransaksi, tanggalCheckin, totalPembayaran, ];

}

/*
{
	"data": [
		{
			"Nama": "andis",
			"id_reservasi": "P51123-13",
			"tanggal_transaksi": "2023-11-05T00:00:00Z",
			"tanggal_checkin": "2023-12-26T00:00:00Z",
			"total_pembayaran": 800000
		},
		{
			"Nama": "andis",
			"id_reservasi": "P61123-49",
			"tanggal_transaksi": "2023-11-06T00:00:00Z",
			"tanggal_checkin": "2023-11-08T00:00:00Z",
			"total_pembayaran": 750000
		},
		{
			"Nama": "andis",
			"id_reservasi": "P61123-53",
			"tanggal_transaksi": "2023-11-06T00:00:00Z",
			"tanggal_checkin": "2024-01-09T00:00:00Z",
			"total_pembayaran": 900000
		}
	],
	"error": false
}*/