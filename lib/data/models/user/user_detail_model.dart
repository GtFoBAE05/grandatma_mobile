import 'package:equatable/equatable.dart';

import '../../../domain/entities/user/UserDetail.dart';

class UserDetailModel extends Equatable {
  UserDetailModel({
    required this.data,
    required this.error,
  });

  final UserDetailData data;
  final bool error;

  factory UserDetailModel.fromJson(Map<String, dynamic> json) {
    return UserDetailModel(
      data: UserDetailData.fromJson(json["data"]),
      error: json["error"],
    );
  }

  Map<String, dynamic> toJson() => {
        "data": data?.toJson(),
        "error": error,
      };

  @override
  List<Object?> get props => [
        data,
        error,
      ];
}

class UserDetailData extends Equatable {
  UserDetailData({
    required this.id,
    required this.nama,
    required this.email,
    required this.username,
    required this.notelp,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  final int id;
  final String nama;
  final String email;
  final String username;
  final String notelp;
  final String role;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  factory UserDetailData.fromJson(Map<String, dynamic> json) {
    return UserDetailData(
      id: json["id"],
      nama: json["nama"],
      email: json["email"],
      username: json["username"],
      notelp: json["notelp"],
      role: json["role"],
      createdAt: DateTime.tryParse(json["created_at"] ?? ""),
      updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama": nama,
        "email": email,
        "username": username,
        "notelp": notelp,
        "role": role,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };

  UserDetail toEntity() {
    return UserDetail(
        id: this.id,
        nama: this.nama,
        email: this.email,
        username: this.username,
        notelp: this.notelp,
        role: this.role,
        createdAt: this.createdAt,
        updatedAt: this.updatedAt);
  }

  @override
  List<Object?> get props => [
        id,
        nama,
        email,
        username,
        notelp,
        role,
        createdAt,
        updatedAt,
      ];
}

/*
{
	"data": {
		"id": 4,
		"nama": "budiii",
		"email": "budiii@gmail.com",
		"username": "budiii",
		"notelp": "012",
		"password": "",
		"role": "",
		"created_at": "0001-01-01T00:00:00Z",
		"updated_at": "0001-01-01T00:00:00Z"
	},
	"error": false
}*/
