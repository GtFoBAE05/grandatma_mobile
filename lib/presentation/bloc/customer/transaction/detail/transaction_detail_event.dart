part of 'transaction_detail_bloc.dart';

abstract class TransactionDetailEvent extends Equatable {
  const TransactionDetailEvent();
}

class GetTransactionDetail extends TransactionDetailEvent{

  final String id;

  GetTransactionDetail({required this.id});


  @override
  List<Object?> get props => [id];

}
