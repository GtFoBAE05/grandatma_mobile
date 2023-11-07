import 'package:equatable/equatable.dart';
import 'package:grandatma_mobile/domain/entities/room/room_detail.dart';

class RoomDetailResponseModel extends Equatable {
  RoomDetailResponseModel({
    required this.data,
    required this.error,
  });

  final RoomDetailModel data;
  final bool error;

  factory RoomDetailResponseModel.fromJson(Map<String, dynamic> json){
    return RoomDetailResponseModel(
      data: RoomDetailModel.fromJson(json["data"]),
      error: json["error"],
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "error": error,
  };

  @override
  List<Object?> get props => [
    data, error, ];

}

class RoomDetailModel extends Equatable {
  RoomDetailModel({
    required this.id,
    required this.namaTipe,
    required this.pilihanTempatTidur,
    required this.fasilitas,
    required this.deskripsi,
    required this.rincianKamar,
    required this.tarif,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String namaTipe;
  final String pilihanTempatTidur;
  final String fasilitas;
  final String deskripsi;
  final String rincianKamar;
  final int tarif;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory RoomDetailModel.fromJson(Map<String, dynamic> json){
    return RoomDetailModel(
      id: json["id"],
      namaTipe: json["nama_tipe"],
      pilihanTempatTidur: json["pilihan_tempat_tidur"],
      fasilitas: json["fasilitas"],
      deskripsi: json["deskripsi"],
      rincianKamar: json["rincian_kamar"],
      tarif: json["tarif"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_tipe": namaTipe,
    "pilihan_tempat_tidur": pilihanTempatTidur,
    "fasilitas": fasilitas,
    "deskripsi": deskripsi,
    "rincian_kamar": rincianKamar,
    "tarif": tarif,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };

  RoomDetail toEntity(){
    return RoomDetail(
      id: id,
      namaTipe: namaTipe,
      pilihanTempatTidur: pilihanTempatTidur,
      fasilitas: fasilitas,
      deskripsi: deskripsi,
      rincianKamar: rincianKamar,
      tarif: tarif,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id, namaTipe, pilihanTempatTidur, fasilitas, deskripsi, rincianKamar, tarif, createdAt, updatedAt, ];

}

/*
{
	"data": {
		"id": 2,
		"nama_tipe": "superior",
		"pilihan_tempat_tidur": "1 doube atau 1 twin",
		"fasilitas": "inet, hiburan, mm, km",
		"deskripsi": "kapasitas 2 orang",
		"rincian_kamar": "Kamar berukuran 22 meter persegi",
		"tarif": 0,
		"created_at": "2023-11-02T21:37:09.759037+07:00",
		"updated_at": "2023-11-02T21:37:09.759037+07:00"
	},
	"error": false
}*/