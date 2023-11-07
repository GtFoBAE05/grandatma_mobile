import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/transaction/transaction_can_cancel.dart';
import '../../../../../domain/repositories/transaction_repository.dart';

part 'search_transaction_can_cancel_event.dart';
part 'search_transaction_can_cancel_state.dart';

class SearchTransactionCanCancelBloc extends Bloc<SearchTransactionCanCancelEvent, SearchTransactionCanCancelState> {

  final TransactionRepository _transactionRepository;

  SearchTransactionCanCancelBloc(this._transactionRepository) : super(SearchTransactionCanCancelInitial()) {
    on<SearchTransactionCanCancel>((event, emit) async {
      emit(SearchTransactionCanCancelLoading());

      final result = await _transactionRepository.searchTransactionCanCancel(event.id);

      result.fold(
        (l) => emit(SearchTransactionCanCancelError(message: l.message)),
        (r) => emit(SearchTransactionCanCancelSuccess(listTransaction: r)),
      );

    });
  }
}
