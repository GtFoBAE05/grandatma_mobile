import 'package:equatable/equatable.dart';

import '../../../domain/entities/transaction/transaction_detail.dart';

class TransactionDetailModel extends Equatable {
  TransactionDetailModel({
    required this.data,
    required this.days,
    required this.error,
    required this.fasilitas,
    required this.tarif,
    required this.user,
  });

  final TransactionDetailDataModel? data;
  final int? days;
  final bool? error;
  final List<FasilitasModel> fasilitas;
  final int? tarif;
  final TransactionUserModel? user;

  factory TransactionDetailModel.fromJson(Map<String, dynamic> json){
    return TransactionDetailModel(
      data: json["data"] == null ? null : TransactionDetailDataModel.fromJson(json["data"]),
      days: json["days"],
      error: json["error"],
      fasilitas: json["fasilitas"] == null ? [] : List<FasilitasModel>.from(json["fasilitas"]!.map((x) => FasilitasModel.fromJson(x))),
      tarif: json["tarif"],
      user: json["user"] == null ? null : TransactionUserModel.fromJson(json["user"]),
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "days": days,
    "error": error,
    "fasilitas": fasilitas.map((x) => x?.toJson()).toList(),
    "tarif": tarif,
    "user": user?.toJson(),
  };

  @override
  List<Object?> get props => [
    data, days, error, fasilitas, tarif, user, ];

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
    required this.idTipeKamar,
    required this.tipeKamar,
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
  final String idTipeKamar;
  final String tipeKamar;
  final String pilihanKasur;
  final bool statusBatal;

  factory TransactionDetailDataModel.fromJson(Map<String, dynamic> json){
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
      idTipeKamar: json["IdTipeKamar"],
      tipeKamar: json["TipeKamar"],
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
    "IdTipeKamar": idTipeKamar,
    "TipeKamar": tipeKamar,
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
        tipeKamar: tipeKamar,
        statusBatal: statusBatal);
  }

  @override
  List<Object?> get props => [
    idReservasi, tanggalTransaksi, totalPembayaran, nomorKamar, tanggalCheckin, tanggalCheckout, jumlahDewasa, jumlahAnak, nomorRekening, idTipeKamar, tipeKamar, pilihanKasur, statusBatal, ];

}

class FasilitasModel extends Equatable {
  FasilitasModel({
    required this.id,
    required this.idReservasi,
    required this.namaFasilitas,
    required this.jumlahUnit,
    required this.harga,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String idReservasi;
  final String namaFasilitas;
  final int jumlahUnit;
  final int harga;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory FasilitasModel.fromJson(Map<String, dynamic> json){
    return FasilitasModel(
      id: json["Id"],
      idReservasi: json["IdReservasi"],
      namaFasilitas: json["NamaFasilitas"],
      jumlahUnit: json["JumlahUnit"],
      harga: json["Harga"],
      createdAt: DateTime.tryParse(json["CreatedAt"] ?? ""),
      updatedAt: DateTime.tryParse(json["UpdatedAt"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "Id": id,
    "IdReservasi": idReservasi,
    "NamaFasilitas": namaFasilitas,
    "JumlahUnit": jumlahUnit,
    "Harga": harga,
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
    id, idReservasi, namaFasilitas, jumlahUnit, harga, createdAt, updatedAt, ];

}

class TransactionUserModel extends Equatable {
  TransactionUserModel({
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

  factory TransactionUserModel.fromJson(Map<String, dynamic> json){
    return TransactionUserModel(
      id: json["id"],
      nama: json["nama"],
      email: json["email"],
      username: json["username"],
      notelp: json["notelp"],
      password: json["password"],
      alamat: json["alamat"],
      role: json["role"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama": nama,
    "email": email,
    "username": username,
    "notelp": notelp,
    "password": password,
    "alamat": alamat,
    "role": role,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };

  TransactionUser toEntity(){
    return TransactionUser(
        id: id,
        nama: nama,
        email: email,
        username: username,
        notelp: notelp,
        password: password,
        alamat: alamat,
        role: role,
        createdAt: createdAt,
        updatedAt: updatedAt);
  }

  @override
  List<Object?> get props => [
    id, nama, email, username, notelp, password, alamat, role, createdAt, updatedAt, ];

}

/*
{
	"data": {
		"IdReservasi": "P51123-13",
		"TanggalTransaksi": "2023-11-05T00:00:00Z",
		"TotalPembayaran": 800000,
		"NomorKamar": 5,
		"TanggalCheckin": "2023-12-26T00:00:00Z",
		"TanggalCheckout": "2023-12-27T00:00:00Z",
		"JumlahDewasa": 5,
		"JumlahAnak": 0,
		"NomorRekening": "121",
		"IdTipeKamar": "2",
		"TipeKamar": "superior",
		"PilihanKasur": "1 doube",
		"StatusBatal": false
	},
	"days": 1,
	"error": false,
	"fasilitas": [
		{
			"Id": 20,
			"IdReservasi": "P51123-13",
			"NamaFasilitas": "breakfast",
			"JumlahUnit": 2,
			"Harga": 200000,
			"CreatedAt": "0001-01-01T00:00:00Z",
			"UpdatedAt": "0001-01-01T00:00:00Z"
		}
	],
	"tarif": 400000,
	"user": {
		"id": 0,
		"nama": "andis",
		"email": "",
		"username": "",
		"notelp": "",
		"password": "",
		"alamat": "jalan andi",
		"role": "",
		"created_at": "0001-01-01T00:00:00Z",
		"updated_at": "0001-01-01T00:00:00Z"
	}
}*/