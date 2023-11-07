import 'package:equatable/equatable.dart';

class AddPaidFacilities extends Equatable {
  AddPaidFacilities({
    required this.error,
    required this.message,
  });

  final bool error;
  final String message;

  @override
  List<Object?> get props => [
    error, message, ];

}