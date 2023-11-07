part of 'get_transaction_can_cancel_bloc.dart';

abstract class GetTransactionCanCancelState extends Equatable {
  const GetTransactionCanCancelState();

  @override
  List<Object> get props => [];
}

class GetTransactionCanCancelInitial extends GetTransactionCanCancelState {}
class GetTransactionCanCancelLoading extends GetTransactionCanCancelState {}
class GetTransactionCanCancelSuccess extends GetTransactionCanCancelState {
  final List<TransactionCanCancel> listTransaction;

  GetTransactionCanCancelSuccess({required this.listTransaction});

}
class GetTransactionCanCancelError extends GetTransactionCanCancelState {
  final String message;

  GetTransactionCanCancelError({required this.message});
}
