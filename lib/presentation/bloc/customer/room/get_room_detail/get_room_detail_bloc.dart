import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grandatma_mobile/domain/entities/room/room_detail.dart';

import '../../../../../domain/repositories/room_repository.dart';

part 'get_room_detail_event.dart';

part 'get_room_detail_state.dart';

class GetRoomDetailBloc extends Bloc<GetRoomDetailEvent, GetRoomDetailState> {
  final RoomRepository _roomRepository;

  GetRoomDetailBloc(this._roomRepository) : super(GetRoomDetailInitial()) {
    on<GetRoomDetail>((event, emit) async {
      emit(GetRoomDetailLoading());

      final result = await _roomRepository.getRoomDetail(event.id);

      result.fold((l) => emit(GetRoomDetailError(message: l.message)),
          (r) => emit(GetRoomDetailSuccess(roomDetail: r)));
    });
  }
}
