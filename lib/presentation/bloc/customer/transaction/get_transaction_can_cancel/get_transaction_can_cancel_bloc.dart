import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/transaction/transaction_can_cancel.dart';
import '../../../../../domain/repositories/transaction_repository.dart';

part 'get_transaction_can_cancel_event.dart';

part 'get_transaction_can_cancel_state.dart';

class GetTransactionCanCancelBloc
    extends Bloc<GetTransactionCanCancelEvent, GetTransactionCanCancelState> {

  final TransactionRepository _transactionRepository;

  GetTransactionCanCancelBloc(this._transactionRepository)
      : super(GetTransactionCanCancelInitial()) {
    on<GetTransactionCanCancel>((event, emit) async {
      emit(GetTransactionCanCancelLoading());

      final result = await _transactionRepository.getTransactionCanCancel();

      result.fold((l) =>
          emit(GetTransactionCanCancelError(message: l.message)), (r)
      =>
          emit(GetTransactionCanCancelSuccess(listTransaction: r)));
    });
  }
}
