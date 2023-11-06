import 'package:equatable/equatable.dart';

class Signup extends Equatable {
  final bool error;
  final String message;

  Signup({
    required this.error,
    required this.message,
  });

  @override
  List<Object?> get props => [
    error, message, ];

}
