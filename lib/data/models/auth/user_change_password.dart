import 'package:equatable/equatable.dart';

import '../../../domain/entities/auth/user_change_password.dart';

class UserChangePasswordModel extends Equatable {
  UserChangePasswordModel({
    required this.error,
    required this.message,
  });

  final bool error;
  final String message;

  factory UserChangePasswordModel.fromJson(Map<String, dynamic> json){
    return UserChangePasswordModel(
      error: json["error"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
  };

  UserChangePassword toEntity() {
    return UserChangePassword(error: this.error, message: this.message);
  }

  @override
  List<Object?> get props => [
    error, message, ];
}