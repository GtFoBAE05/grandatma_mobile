import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/repositories/transaction_repository.dart';

part 'do_cancel_transaction_event.dart';

part 'do_cancel_transaction_state.dart';

class DoCancelTransactionBloc
    extends Bloc<DoCancelTransactionEvent, DoCancelTransactionState> {
  final TransactionRepository _transactionRepository;

  DoCancelTransactionBloc(this._transactionRepository)
      : super(DoCancelTransactionInitial()) {
    on<DoCancelTransaction>((event, emit) async {
      emit(DoCancelTransactionLoading());

      final result = await _transactionRepository.doCancelTransaction(event.id);

      result.fold((l) => emit(DoCancelTransactionError(message: l.message)),
          (r) => emit(DoCancelTransactionSuccess(message: r.message)));
    });
  }
}
