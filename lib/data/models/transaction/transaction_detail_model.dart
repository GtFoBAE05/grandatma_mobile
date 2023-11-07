import 'package:equatable/equatable.dart';

import '../../../domain/entities/transaction/transaction_detail.dart';

class TransactionDetailModel extends Equatable {
  TransactionDetailModel({
    required this.data,
    required this.error,
    required this.fasilitas,
  });

  final TransactionDetailDataModel? data;
  final bool? error;
  final List<FasilitasModel> fasilitas;

  factory TransactionDetailModel.fromJson(Map<String, dynamic> json) {
    return TransactionDetailModel(
      data: json["data"] == null
          ? null
          : TransactionDetailDataModel.fromJson(json["data"]),
      error: json["error"],
      fasilitas: json["fasilitas"] == null
          ? []
          : List<FasilitasModel>.from(
              json["fasilitas"]!.map((x) => FasilitasModel.fromJson(x))),
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "error": error,
        "fasilitas": fasilitas.map((x) => x?.toJson()).toList(),
      };

  @override
  List<Object?> get props => [
        data,
        error,
        fasilitas,
      ];
}

class TransactionDetailDataModel extends Equatable {
  TransactionDetailDataModel({
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

  factory TransactionDetailDataModel.fromJson(Map<String, dynamic> json) {
    return TransactionDetailDataModel(
      idReservasi: json["IdReservasi"],
      tanggalTransaksi: DateTime.tryParse(json["TanggalTransaksi"] ?? ""),
      totalPembayaran: json["TotalPembayaran"],
      nomorKamar: json["NomorKamar"],
      tanggalCheckin: DateTime.tryParse(json["TanggalCheckin"] ?? ""),
      tanggalCheckout: DateTime.tryParse(json["TanggalCheckout"] ?? ""),
      jumlahDewasa: json["JumlahDewasa"],
      jumlahAnak: json["JumlahAnak"],
      nomorRekening: json["NomorRekening"],
      pilihanKasur: json["PilihanKasur"],
      statusBatal: json["StatusBatal"],
    );
  }

  Map<String, dynamic> toJson() => {
        "IdReservasi": idReservasi,
        "TanggalTransaksi": tanggalTransaksi?.toIso8601String(),
        "TotalPembayaran": totalPembayaran,
        "NomorKamar": nomorKamar,
        "TanggalCheckin": tanggalCheckin?.toIso8601String(),
        "TanggalCheckout": tanggalCheckout?.toIso8601String(),
        "JumlahDewasa": jumlahDewasa,
        "JumlahAnak": jumlahAnak,
        "NomorRekening": nomorRekening,
        "PilihanKasur": pilihanKasur,
        "StatusBatal": statusBatal,
      };

  TransactionDetailData toEntity() {
    return TransactionDetailData(
        idReservasi: idReservasi,
        tanggalTransaksi: tanggalTransaksi,
        totalPembayaran: totalPembayaran,
        nomorKamar: nomorKamar,
        tanggalCheckin: tanggalCheckin,
        tanggalCheckout: tanggalCheckout,
        jumlahDewasa: jumlahDewasa,
        jumlahAnak: jumlahAnak,
        nomorRekening: nomorRekening,
        pilihanKasur: pilihanKasur,
        statusBatal: statusBatal);
  }

  @override
  List<Object?> get props => [
        idReservasi,
        tanggalTransaksi,
        totalPembayaran,
        nomorKamar,
        tanggalCheckin,
        tanggalCheckout,
        jumlahDewasa,
        jumlahAnak,
        nomorRekening,
        pilihanKasur,
        statusBatal,
      ];
}

class FasilitasModel extends Equatable {
  FasilitasModel({
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

  factory FasilitasModel.fromJson(Map<String, dynamic> json) {
    return FasilitasModel(
      id: json["Id"],
      idReservasi: json["IdReservasi"],
      namaFasilitas: json["NamaFasilitas"],
      jumlahUnit: json["JumlahUnit"],
      createdAt: DateTime.tryParse(json["CreatedAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["UpdatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "Id": id,
        "IdReservasi": idReservasi,
        "NamaFasilitas": namaFasilitas,
        "JumlahUnit": jumlahUnit,
        "CreatedAt": createdAt?.toIso8601String(),
        "UpdatedAt": updatedAt?.toIso8601String(),
      };

  Fasilitas toEntity() {
    return Fasilitas(
        id: id,
        idReservasi: idReservasi,
        namaFasilitas: namaFasilitas,
        jumlahUnit: jumlahUnit,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  @override
  List<Object?> get props => [
        id,
        idReservasi,
        namaFasilitas,
        jumlahUnit,
        createdAt,
        updatedAt,
      ];
}

/*
{
	"data": {
		"IdReservasi": "12fefP",
		"TanggalTransaksi": "2023-10-16T00:00:00Z",
		"TotalPembayaran": 3400000,
		"NomorKamar": 8,
		"TanggalCheckin": "2023-12-08T00:00:00Z",
		"TanggalCheckout": "2023-12-10T00:00:00Z",
		"JumlahDewasa": 2,
		"JumlahAnak": 0,
		"NomorRekening": "02199",
		"PilihanKasur": "1 double",
		"StatusBatal": true
	},
	"error": false,
	"fasilitas": [
		{
			"Id": 6,
			"IdReservasi": "12fefP",
			"NamaFasilitas": "breakfast",
			"JumlahUnit": 2,
			"CreatedAt": "0001-01-01T00:00:00Z",
			"UpdatedAt": "0001-01-01T00:00:00Z"
		}
	]
}*/
