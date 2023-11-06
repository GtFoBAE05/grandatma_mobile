part of 'transaction_detail_bloc.dart';

abstract class TransactionDetailState extends Equatable {
  const TransactionDetailState();
  @override
  List<Object> get props => [];
}

class TransactionDetailInitial extends TransactionDetailState {}
class TransactionDetailLoading extends TransactionDetailState {}
class TransactionDetailSuccess extends TransactionDetailState {
  final TransactionDetail transactionDetail;

  TransactionDetailSuccess({required this.transactionDetail});


}
class TransactionDetailError extends TransactionDetailState {
  final String message;

  TransactionDetailError({required this.message});

}
