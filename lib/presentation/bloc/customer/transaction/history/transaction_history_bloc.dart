import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/transaction/transaction_history.dart';
import '../../../../../domain/repositories/transaction_repository.dart';

part 'transaction_history_event.dart';
part 'transaction_history_state.dart';

class TransactionHistoryBloc extends Bloc<TransactionHistoryEvent, TransactionHistoryState> {

  final TransactionRepository _transactionRepositoryImpl;


  TransactionHistoryBloc(this._transactionRepositoryImpl) : super(TransactionHistoryInitial()) {

    on<GetTransactionHistory>((event, emit)async {
      final result = await _transactionRepositoryImpl.getTransactionHistory();

      result.fold(
        (l) => emit(TransactionHistoryError(message: l.message)),
        (r) => emit(TransactionHistorySuccess(transactionHistory: r)),
      );

    });
  }
}
