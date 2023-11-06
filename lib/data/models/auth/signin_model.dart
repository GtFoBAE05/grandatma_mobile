import 'package:equatable/equatable.dart';

import '../../../domain/entities/auth/signin.dart';

class SigninModel extends Equatable {
  SigninModel({
    required this.error,
    required this.role,
    required this.token,
  });

  final bool error;
  final String role;
  final String token;

  factory SigninModel.fromJson(Map<String, dynamic> json){
    return SigninModel(
      error: json["error"],
      role: json["role"],
      token: json["token"],
    );
  }

  Map<String, dynamic> toJson() => {
    "error": error,
    "role": role,
    "token": token,
  };

  Signin toEntity() {
    return Signin(error: this.error, role: this.role, token: this.token);
  }

  @override
  List<Object?> get props => [
    error, role, token, ];

}

/*
{
	"error": false,
	"role": "owner",
	"token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHBpcmVzIjoiMjAyMy0xMC0yOVQyMzo0NzowOC45ODY2NjMrMDc6MDAiLCJpZCI6MTgsInJvbGUiOiJvd25lciJ9.sqm1QNUkT4wgUNNfYz7LKvEJlWpMwLRwQEmSKVzwmu4"
}*/