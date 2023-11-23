part of 'new_customer_bloc.dart';

abstract class NewCustomerState extends Equatable {
  const NewCustomerState();
  @override
  List<Object> get props => [];
}

class NewCustomerInitial extends NewCustomerState {}
class NewCustomerLoading extends NewCustomerState {}
class NewCustomerSuccess extends NewCustomerState {
  final List<Map<String,int>> newCustomers;

  NewCustomerSuccess({required this.newCustomers});

}
class NewCustomerError extends NewCustomerState {
  final String message;

  NewCustomerError({required this.message});
}
