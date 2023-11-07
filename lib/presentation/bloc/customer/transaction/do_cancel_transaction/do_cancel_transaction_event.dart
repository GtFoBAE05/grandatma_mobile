part of 'do_cancel_transaction_bloc.dart';

abstract class DoCancelTransactionEvent extends Equatable {
  const DoCancelTransactionEvent();
}

class DoCancelTransaction extends DoCancelTransactionEvent{
  final String id;

  DoCancelTransaction({required this.id});

  @override
  List<Object?> get props => [id];
}
