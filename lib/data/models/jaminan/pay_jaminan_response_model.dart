import 'package:equatable/equatable.dart';

import '../../../domain/entities/jaminan/pay_jaminan.dart';

class PayJaminanResponseModel extends Equatable {
  PayJaminanResponseModel({
    required this.message,
    required this.error,
  });

  final String message;
  final bool error;

  factory PayJaminanResponseModel.fromJson(Map<String, dynamic> json){
    return PayJaminanResponseModel(
      message: json["message"],
      error: json["error"],
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
  };

  PayJaminan toEntity(){
    return PayJaminan(
      message: message,
      error: error,
    );
  }

  @override
  List<Object?> get props => [
    message, error, ];

}

/*
{
	"message": "Success delete",
	"error": false
}*/