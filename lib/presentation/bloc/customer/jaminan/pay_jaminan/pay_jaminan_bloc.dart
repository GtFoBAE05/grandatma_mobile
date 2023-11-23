import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/repositories/jaminan_respotory.dart';

part 'pay_jaminan_event.dart';
part 'pay_jaminan_state.dart';

class PayJaminanBloc extends Bloc<PayJaminanEvent, PayJaminanState> {

  final JaminanRepository _jaminanRepository;

  PayJaminanBloc(this._jaminanRepository) : super(PayJaminanInitial()) {
    on<DoPayJaminan>((event, emit) async {
      emit(PayJaminanLoading());
      final result = await _jaminanRepository.doPayJaminan(event.id, event.nominal, event.nomorRekening);

      result.fold(
        (l) => emit(PayJaminanError(message: l.message)),
        (r) => emit(PayJaminanSuccess(message: r.message.toString()))
      );

    });
  }
}
