part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryState extends Equatable {
  const TransactionHistoryState();

  @override
  List<Object> get props => [];
}

class TransactionHistoryInitial extends TransactionHistoryState {}
class TransactionHistoryLoading extends TransactionHistoryState {}
class TransactionHistorySuccess extends TransactionHistoryState {
  final List<TransactionHistory> transactionHistory;

  TransactionHistorySuccess({required this.transactionHistory});
}
class TransactionHistoryError extends TransactionHistoryState {
  final String message;

  TransactionHistoryError({required this.message});
}
