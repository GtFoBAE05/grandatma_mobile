import 'package:equatable/equatable.dart';

class TopCustomerReportData extends Equatable {
  TopCustomerReportData({
    required this.name,
    required this.reservationCount,
    required this.totalPayment,
  });

  final String? name;
  final String? reservationCount;
  final String? totalPayment;



  @override
  List<Object?> get props => [
    name, reservationCount, totalPayment, ];

}