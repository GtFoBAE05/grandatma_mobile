

import 'package:equatable/equatable.dart';

class UserChangePassword extends Equatable {
  final bool error;
  final String message;

  UserChangePassword({
    required this.error,
    required this.message,
  });

  @override
  List<Object?> get props => [
    error, message, ];

}