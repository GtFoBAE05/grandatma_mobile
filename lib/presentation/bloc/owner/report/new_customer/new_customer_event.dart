part of 'new_customer_bloc.dart';

abstract class NewCustomerEvent extends Equatable {
  const NewCustomerEvent();
}

class fetchNewCustomer extends NewCustomerEvent{
  final String year;
  fetchNewCustomer(this.year);

  @override
  List<Object?> get props =>[];
}
