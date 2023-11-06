import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grandatma_mobile/domain/entities/transaction/transaction_detail.dart';

import '../../../../../domain/repositories/transaction_repository.dart';

part 'transaction_detail_event.dart';

part 'transaction_detail_state.dart';

class TransactionDetailBloc
    extends Bloc<TransactionDetailEvent, TransactionDetailState> {
  final TransactionRepository _transactionRepository;

  TransactionDetailBloc(this._transactionRepository)
      : super(TransactionDetailInitial()) {
    on<GetTransactionDetail>((event, emit) async {
      emit(TransactionDetailLoading());
      final result =
          await _transactionRepository.getTransactionDetail(event.id);

      result.fold((l) => emit(TransactionDetailError(message: l.message)),
          (r) => emit(TransactionDetailSuccess(transactionDetail: r)));
    });
  }
}
