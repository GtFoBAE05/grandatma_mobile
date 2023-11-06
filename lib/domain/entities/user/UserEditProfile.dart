import 'package:equatable/equatable.dart';

class UserEditProfile extends Equatable {
  final bool error;
  final String message;

  UserEditProfile({
    required this.error,
    required this.message,
  });

  @override
  List<Object?> get props => [
    error, message, ];

}