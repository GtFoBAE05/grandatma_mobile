import 'package:equatable/equatable.dart';

class NewCustomerReport extends Equatable {
  NewCustomerReport({
    required this.data,
    required this.error,
    required this.message,
  });

  final List<Map<String, int>> data;
  final bool? error;
  final String? message;



  @override
  List<Object?> get props => [
    data, error, message, ];

}