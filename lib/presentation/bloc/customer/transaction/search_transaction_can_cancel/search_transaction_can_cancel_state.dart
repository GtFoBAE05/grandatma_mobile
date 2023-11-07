part of 'search_transaction_can_cancel_bloc.dart';

abstract class SearchTransactionCanCancelState extends Equatable {
  const SearchTransactionCanCancelState();

  @override
  List<Object> get props => [];
}

class SearchTransactionCanCancelInitial extends SearchTransactionCanCancelState {}
class SearchTransactionCanCancelLoading extends SearchTransactionCanCancelState {}
class SearchTransactionCanCancelSuccess extends SearchTransactionCanCancelState {
  final List<TransactionCanCancel> listTransaction;

  SearchTransactionCanCancelSuccess({required this.listTransaction});
}
class SearchTransactionCanCancelError extends SearchTransactionCanCancelState {
  final String message;

  SearchTransactionCanCancelError({required this.message});
}

