import 'package:equatable/equatable.dart';

class AvailRoomResponseModel extends Equatable {
  AvailRoomResponseModel({
    required this.data,
    required this.error,
  });

  final List<RoomModel> data;
  final bool? error;

  factory AvailRoomResponseModel.fromJson(Map<String, dynamic> json){
    return AvailRoomResponseModel(
      data: json["data"] == null ? [] : List<RoomModel>.from(json["data"]!.map((x) => RoomModel.fromJson(x))),
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

class RoomModel extends Equatable {
  RoomModel({
    required this.id,
    required this.nomorKamar,
    required this.idTipeKamar,
    required this.namaTipe,
    required this.statusKamar,
    required this.idSeason,
    required this.tarif,
  });

  final int? id;
  final String? nomorKamar;
  final int? idTipeKamar;
  final String? namaTipe;
  final String? statusKamar;
  final int? idSeason;
  final int? tarif;

  factory RoomModel.fromJson(Map<String, dynamic> json){
    return RoomModel(
      id: json["Id"],
      nomorKamar: json["NomorKamar"],
      idTipeKamar: json["IdTipeKamar"],
      namaTipe: json["NamaTipe"],
      statusKamar: json["StatusKamar"],
      idSeason: json["IdSeason"],
      tarif: json["Tarif"],
    );
  }

  Map<String, dynamic> toJson() => {
    "Id": id,
    "NomorKamar": nomorKamar,
    "IdTipeKamar": idTipeKamar,
    "NamaTipe": namaTipe,
    "StatusKamar": statusKamar,
    "IdSeason": idSeason,
    "Tarif": tarif,
  };

  RoomModel toEntity(){
    return RoomModel(
      id: id,
      nomorKamar: nomorKamar,
      idTipeKamar: idTipeKamar,
      namaTipe: namaTipe,
      statusKamar: statusKamar,
      idSeason: idSeason,
      tarif: tarif,
    );
  }

  @override
  List<Object?> get props => [
    id, nomorKamar, idTipeKamar, namaTipe, statusKamar, idSeason, tarif, ];

}

/*
{
	"data": [
		{
			"Id": 8,
			"NomorKamar": "99",
			"IdTipeKamar": 3,
			"NamaTipe": "double duluxe",
			"StatusKamar": "Kamar dapat dipakai",
			"IdSeason": 2,
			"Tarif": 750000
		}
	],
	"error": false
}*/