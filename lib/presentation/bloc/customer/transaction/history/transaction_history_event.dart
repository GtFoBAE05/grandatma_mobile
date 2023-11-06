part of 'transaction_history_bloc.dart';

abstract class TransactionHistoryEvent extends Equatable {
  const TransactionHistoryEvent();
}

class GetTransactionHistory extends TransactionHistoryEvent {
  @override
  List<Object?> get props => [];
}
