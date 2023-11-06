import 'package:equatable/equatable.dart';

class CancelTransactionResponseModel extends Equatable {
  CancelTransactionResponseModel({
    required this.message,
    required this.error,
  });

  final String? message;
  final bool? error;

  factory CancelTransactionResponseModel.fromJson(Map<String, dynamic> json){
    return CancelTransactionResponseModel(
      message: json["message"],
      error: json["error"],
    );
  }

  Map<String, dynamic> toJson() => {
    "message": message,
    "error": error,
  };

  @override
  List<Object?> get props => [
    message, error, ];

}

/*
{
	"message": "Success delete",
	"error": false
}*/