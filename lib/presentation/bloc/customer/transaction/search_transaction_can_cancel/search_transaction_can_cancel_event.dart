part of 'search_transaction_can_cancel_bloc.dart';

abstract class SearchTransactionCanCancelEvent extends Equatable {
  const SearchTransactionCanCancelEvent();
}

class SearchTransactionCanCancel extends SearchTransactionCanCancelEvent{
  final String id;

  SearchTransactionCanCancel({required this.id});

  @override
  List<Object?> get props => [id];

}