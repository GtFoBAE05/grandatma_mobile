part of 'do_cancel_transaction_bloc.dart';

abstract class DoCancelTransactionState extends Equatable {
  const DoCancelTransactionState();

  @override
  List<Object> get props => [];
}

class DoCancelTransactionInitial extends DoCancelTransactionState {}
class DoCancelTransactionLoading extends DoCancelTransactionState {}
class DoCancelTransactionSuccess extends DoCancelTransactionState {
  final String message;

  DoCancelTransactionSuccess({required this.message});
}
class DoCancelTransactionError extends DoCancelTransactionState {
  final String message;

  DoCancelTransactionError({required this.message});

}
