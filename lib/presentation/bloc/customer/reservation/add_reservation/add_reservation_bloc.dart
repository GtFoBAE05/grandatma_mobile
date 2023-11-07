import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/repositories/reservation_repository.dart';

part 'add_reservation_event.dart';

part 'add_reservation_state.dart';

class AddReservationBloc
    extends Bloc<AddReservationEvent, AddReservationState> {
  final ReservationRepository _reservationRepository;

  AddReservationBloc(this._reservationRepository)
      : super(AddReservationInitial()) {
    on<DoAddReservation>((event, emit) async {
      emit(AddReservationLoading());

      final result = await _reservationRepository.addReservation(
          event.idKamar,
          event.tanggalCheckin,
          event.tanggalCheckout,
          event.jumlahDewasa,
          event.jumlahAnak,
          event.nomorRekening,
          event.pilihanKasur);

      result.fold((l) => emit(AddReservationError(message: l.message)),
          (r) => AddReservationSuccess(idReservasi: r.idReservasi));
    });
  }
}
