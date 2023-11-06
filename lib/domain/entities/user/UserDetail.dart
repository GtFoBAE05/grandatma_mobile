import 'package:equatable/equatable.dart';

class UserDetail extends Equatable {
  UserDetail({
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


  @override
  List<Object?> get props => [
    id, nama, email, username, notelp, role, createdAt, updatedAt, ];

}