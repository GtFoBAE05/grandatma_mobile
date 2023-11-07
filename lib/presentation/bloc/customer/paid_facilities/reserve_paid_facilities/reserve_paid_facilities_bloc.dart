import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/repositories/paid_facilities_repository.dart';

part 'reserve_paid_facilities_event.dart';

part 'reserve_paid_facilities_state.dart';

class ReservePaidFacilitiesBloc
    extends Bloc<ReservePaidFacilitiesEvent, ReservePaidFacilitiesState> {
  final PaidFacilitiesRepository _paidFacilitiesRepository;

  ReservePaidFacilitiesBloc(this._paidFacilitiesRepository)
      : super(ReservePaidFacilitiesInitial()) {
    on<DoReservePaidFacilities>((event, emit) async {
      emit(ReservePaidFacilitiesLoading());

      final result = await _paidFacilitiesRepository.addPaidFacilities(
          event.idReservasi, event.paidFacilityId, event.jumlahUnit);

      result.fold((l) => emit(ReservePaidFacilitiesError(message: l.message)),
          (r) => emit(ReservePaidFacilitiesSuccess(message: r.message.toString())));
    });
  }
}
