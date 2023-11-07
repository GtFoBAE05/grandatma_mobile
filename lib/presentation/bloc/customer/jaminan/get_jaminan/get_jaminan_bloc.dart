import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/jaminan/Jaminan.dart';
import '../../../../../domain/repositories/jaminan_respotory.dart';

part 'get_jaminan_event.dart';

part 'get_jaminan_state.dart';

class GetJaminanBloc extends Bloc<GetJaminanEvent, GetJaminanState> {
  final JaminanRepository _jaminanRepository;

  GetJaminanBloc(this._jaminanRepository) : super(GetJaminanInitial()) {
    on<GetJaminan>((event, emit) async {
      emit(GetJaminanLoading());

      final result = await _jaminanRepository.getJaminan();
      result.fold((l) => emit(GetJaminanError(message: l.message)),
          (r) => emit(GetJaminanSuccess(listJaminan: r)));
    });
  }
}
