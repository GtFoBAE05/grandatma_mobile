import 'package:equatable/equatable.dart';

class AddPaidFacilitiesResponseModel extends Equatable {
  AddPaidFacilitiesResponseModel({
    required this.error,
    required this.message,
  });

  final bool? error;
  final String? message;

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

  AddPaidFacilitiesResponseModel toEntity(){
    return AddPaidFacilitiesResponseModel(
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