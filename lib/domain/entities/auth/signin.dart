import 'package:equatable/equatable.dart';

class Signin extends Equatable {
  Signin({
    required this.error,
    required this.role,
    required this.token,
  });

  final bool error;
  final String role;
  final String token;

  @override
  List<Object?> get props => [
    error, role, token, ];

}
