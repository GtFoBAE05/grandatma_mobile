import 'package:equatable/equatable.dart';

import '../../../domain/entities/auth/signup.dart';

class SignupModel extends Equatable {
  SignupModel({
    required this.error,
    required this.message,
  });

  final bool error;
  final String message;

  factory SignupModel.fromJson(Map<String, dynamic> json){
    return SignupModel(
      error: json["error"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
  };

  Signup toEntity() {
    return Signup(error: this.error, message: this.message);
  }

  @override
  List<Object?> get props => [
    error, message, ];
}
