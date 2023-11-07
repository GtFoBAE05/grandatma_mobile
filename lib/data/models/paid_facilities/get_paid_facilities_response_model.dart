import 'package:equatable/equatable.dart';
import 'package:grandatma_mobile/domain/entities/paid_facilities/get%20_paid_facilities.dart';

class PaidFacilitiesResponseModel extends Equatable {
  PaidFacilitiesResponseModel({
    required this.data,
    required this.error,
  });

  final List<PaidFacilitiesModel> data;
  final bool? error;

  factory PaidFacilitiesResponseModel.fromJson(Map<String, dynamic> json){
    return PaidFacilitiesResponseModel(
      data: json["data"] == null ? [] : List<PaidFacilitiesModel>.from(json["data"]!.map((x) => PaidFacilitiesModel.fromJson(x))),
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

class PaidFacilitiesModel extends Equatable {
  PaidFacilitiesModel({
    required this.id,
    required this.namaFasilitas,
    required this.harga,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? namaFasilitas;
  final int? harga;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory PaidFacilitiesModel.fromJson(Map<String, dynamic> json){
    return PaidFacilitiesModel(
      id: json["id"],
      namaFasilitas: json["nama_fasilitas"],
      harga: json["harga"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "nama_fasilitas": namaFasilitas,
    "harga": harga,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
  };

  PaidFacilities toEntity(){
    return PaidFacilities(
      id: id,
      namaFasilitas: namaFasilitas,
      harga: harga,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }

  @override
  List<Object?> get props => [
    id, namaFasilitas, harga, createdAt, updatedAt, ];

}

/*
{
	"data": [
		{
			"id": 1,
			"nama_fasilitas": "breakfast",
			"harga": 200000,
			"created_at": "2023-10-15T17:21:53.641733+07:00",
			"updated_at": "2023-10-15T17:24:14.062801+07:00"
		},
		{
			"id": 2,
			"nama_fasilitas": "selimut tambahan",
			"harga": 150000,
			"created_at": "2023-10-24T17:41:57.105874+07:00",
			"updated_at": "2023-10-24T17:52:42.042055+07:00"
		},
		{
			"id": 6,
			"nama_fasilitas": "cleaning service",
			"harga": 50000,
			"created_at": "2023-11-01T02:10:57.174574+07:00",
			"updated_at": "2023-11-01T02:10:57.174574+07:00"
		},
		{
			"id": 7,
			"nama_fasilitas": "extra kopi",
			"harga": 555555,
			"created_at": "2023-11-01T09:19:34.921173+07:00",
			"updated_at": "2023-11-02T15:42:02.182458+07:00"
		}
	],
	"error": false
}*/