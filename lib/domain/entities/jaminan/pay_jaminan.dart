import 'package:equatable/equatable.dart';

class PayJaminan extends Equatable {
  PayJaminan({
    required this.message,
    required this.error,
  });

  final String? message;
  final bool? error;



  @override
  List<Object?> get props => [
    message, error, ];

}