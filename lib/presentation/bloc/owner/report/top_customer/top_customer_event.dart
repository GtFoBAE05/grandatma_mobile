part of 'top_customer_bloc.dart';

abstract class TopCustomerEvent extends Equatable {
  const TopCustomerEvent();
}

class fetchTopCustomer extends TopCustomerEvent {
  final String year;

  fetchTopCustomer(this.year);

  @override
  List<Object> get props => [year];
}