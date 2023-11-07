import 'package:equatable/equatable.dart';
import 'package:grandatma_mobile/domain/entities/reservation/add_reservation.dart';

class AddReservationResponseModel extends Equatable {
  AddReservationResponseModel({
    required this.data,
    required this.error,
    required this.message,
  });

  final AddReservationModel data;
  final bool error;
  final String message;

  factory AddReservationResponseModel.fromJson(Map<String, dynamic> json){
    return AddReservationResponseModel(
      data: AddReservationModel.fromJson(json["data"]),
      error: json["error"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "error": error,
    "message": message,
  };

  @override
  List<Object?> get props => [
    data, error, message, ];

}

class AddReservationModel extends Equatable {
  AddReservationModel({
    required this.idReservasi,
  });

  final String idReservasi;

  factory AddReservationModel.fromJson(Map<String, dynamic> json){
    return AddReservationModel(
      idReservasi: json["id_reservasi"],
    );
  }

  Map<String, dynamic> toJson() => {
    "id_reservasi": idReservasi,
  };

  AddReservation toEntity(){
    return AddReservation(
      idReservasi: idReservasi,
    );
  }

  @override
  List<Object?> get props => [
    idReservasi, ];

}

/*
{
	"data": {
		"id_reservasi": "P61123-53"
	},
	"error": false,
	"message": "Success create reservasi"
}*/