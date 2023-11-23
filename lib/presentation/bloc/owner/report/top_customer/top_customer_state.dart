part of 'top_customer_bloc.dart';

abstract class TopCustomerState extends Equatable {
  const TopCustomerState();
  @override
  List<Object> get props => [];
}

class TopCustomerInitial extends TopCustomerState {}
class TopCustomerLoading extends TopCustomerState {}
class TopCustomerSuccess extends TopCustomerState {
  final List<TopCustomerReportData> topCustomers;

  TopCustomerSuccess({required this.topCustomers});

}
class TopCustomerError extends TopCustomerState {
  final String message;

  TopCustomerError({required this.message});
}
