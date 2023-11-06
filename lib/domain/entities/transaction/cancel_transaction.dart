import 'package:equatable/equatable.dart';

class CancelTransaction extends Equatable {
  CancelTransaction({
    required this.message,
    required this.error,
  });

  final String? message;
  final bool? error;

  factory CancelTransaction.fromJson(Map<String, dynamic> json){
    return CancelTransaction(
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