import 'package:equatable/equatable.dart';

import '../../../domain/entities/transaction/transaction_history.dart';

class TransactionHistoryModel extends Equatable {
  TransactionHistoryModel({
    required this.data,
    required this.error,
  });

  final List<TransactionHistoryDataModel> data;
  final bool? error;

  factory TransactionHistoryModel.fromJson(Map<String, dynamic> json){
    return TransactionHistoryModel(
      data: json["data"] == null ? [] : List<TransactionHistoryDataModel>.from(json["data"]!.map((x) => TransactionHistoryDataModel.fromJson(x))),
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

class TransactionHistoryDataModel extends Equatable {
  TransactionHistoryDataModel({
    required this.idReservasi,
    required this.tanggalTransaksi,
    required this.totalPembayaran,
  });

  final String idReservasi;
  final DateTime? tanggalTransaksi;
  final int totalPembayaran;

  factory TransactionHistoryDataModel.fromJson(Map<String, dynamic> json){
    return TransactionHistoryDataModel(
      idReservasi: json["id_reservasi"],
      tanggalTransaksi: DateTime.tryParse(json["tanggal_transaksi"] ?? ""),
      totalPembayaran: json["total_pembayaran"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id_reservasi": idReservasi,
    "tanggal_transaksi": tanggalTransaksi?.toIso8601String(),
    "total_pembayaran": totalPembayaran,
  };

  TransactionHistory toEntity(){
    return TransactionHistory(
      idReservasi: idReservasi,
      tanggalTransaksi: tanggalTransaksi,
      totalPembayaran: totalPembayaran,
    );
  }

  @override
  List<Object?> get props => [
    idReservasi, tanggalTransaksi, totalPembayaran, ];

}

/*
{
	"data": [
		{
			"id_reservasi": "12fefP",
			"tanggal_transaksi": "2023-10-16T00:00:00Z",
			"total_pembayaran": 3400000
		},
		{
			"id_reservasi": "12ADawd",
			"tanggal_transaksi": "2023-10-17T00:00:00Z",
			"total_pembayaran": 3000000
		},
		{
			"id_reservasi": "P181023-18",
			"tanggal_transaksi": "2023-10-18T00:00:00Z",
			"total_pembayaran": 1500000
		},
		{
			"id_reservasi": "G181023-24",
			"tanggal_transaksi": "2023-10-18T00:00:00Z",
			"total_pembayaran": 3000000
		}
	],
	"error": false
}*/