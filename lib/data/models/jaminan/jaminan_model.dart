import 'package:equatable/equatable.dart';

class JaminanResponseModel extends Equatable {
  JaminanResponseModel({
    required this.data,
    required this.error,
  });

  final List<JaminanModel> data;
  final bool? error;

  factory JaminanResponseModel.fromJson(Map<String, dynamic> json){
    return JaminanResponseModel(
      data: json["data"] == null ? [] : List<JaminanModel>.from(json["data"]!.map((x) => JaminanModel.fromJson(x))),
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

class JaminanModel extends Equatable {
  JaminanModel({
    required this.id,
    required this.idReservasi,
    required this.nominal,
    required this.totalPembayaran,
    required this.statusLunas,
  });

  final int? id;
  final String? idReservasi;
  final int? nominal;
  final int? totalPembayaran;
  final bool? statusLunas;

  factory JaminanModel.fromJson(Map<String, dynamic> json){
    return JaminanModel(
      id: json["id"],
      idReservasi: json["id_reservasi"],
      nominal: json["nominal"],
      totalPembayaran: json["total_pembayaran"],
      statusLunas: json["status_lunas"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "id_reservasi": idReservasi,
    "nominal": nominal,
    "total_pembayaran": totalPembayaran,
    "status_lunas": statusLunas,
  };

  JaminanModel toEntity(){
    return JaminanModel(
      id: id,
      idReservasi: idReservasi,
      nominal: nominal,
      totalPembayaran: totalPembayaran,
      statusLunas: statusLunas,
    );
  }

  @override
  List<Object?> get props => [
    id, idReservasi, nominal, totalPembayaran, statusLunas, ];

}

/*
{
	"data": [
		{
			"id": 9,
			"id_reservasi": "P51123-13",
			"nominal": 800000,
			"total_pembayaran": 800000,
			"status_lunas": true
		},
	],
	"error": false
}*/