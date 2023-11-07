import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/reservation/check_available_room.dart';
import '../../../../../domain/repositories/room_repository.dart';

part 'get_available_room_event.dart';

part 'get_available_room_state.dart';

class GetAvailableRoomBloc
    extends Bloc<GetAvailableRoomEvent, GetAvailableRoomState> {
  final RoomRepository _roomRepository;

  GetAvailableRoomBloc(this._roomRepository)
      : super(GetAvailableRoomInitial()) {
    on<SearchAvailableRoom>((event, emit) async {
      emit(GetAvailableRoomLoading());

      final result = await _roomRepository.getAvailableRoom(
          event.startDate, event.endDate);

      result.fold((l) => emit(GetAvailableRoomError(message: l.message)),
          (r) => GetAvailableRoomSuccess(roomList: r));
    });
  }
}
