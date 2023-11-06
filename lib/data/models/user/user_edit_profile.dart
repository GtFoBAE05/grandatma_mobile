import 'package:equatable/equatable.dart';

import '../../../domain/entities/user/UserEditProfile.dart';

class UserEditProfileModel extends Equatable {
  UserEditProfileModel({
    required this.error,
    required this.message,
  });

  final bool error;
  final String message;

  factory UserEditProfileModel.fromJson(Map<String, dynamic> json){
    return UserEditProfileModel(
      error: json["error"],
      message: json["message"],
    );
  }

  Map<String, dynamic> toJson() => {
    "error": error,
    "message": message,
  };

  UserEditProfile toEntity() {
    return UserEditProfile(error: this.error, message: this.message);
  }

  @override
  List<Object?> get props => [
    error, message, ];
}