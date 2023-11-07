import 'package:equatable/equatable.dart';
import 'package:grandatma_mobile/domain/entities/paid_facilities/add_paid_facilities.dart';

class AddPaidFacilitiesResponseModel extends Equatable {
  AddPaidFacilitiesResponseModel({
    required this.error,
    required this.message,
  });

  final bool error;
  final String message;

  factory AddPaidFacilitiesResponseModel.fromJson(Map<String, dynamic> json){
    return AddPaidFacilitiesResponseModel(
      error: json["error"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
  };

  AddPaidFacilities toEntity(){
    return AddPaidFacilities(
      error: error,
      message: message,
    );
  }

  @override
  List<Object?> get props => [
    error, message, ];

}

/*
{
	"error": false,
	"message": "SUccess create fasilitas reservasi"
}*/