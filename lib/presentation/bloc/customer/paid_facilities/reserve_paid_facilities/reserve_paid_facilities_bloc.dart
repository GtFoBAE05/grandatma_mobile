import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz_unsafe.dart';
import 'package:equatable/equatable.dart';
import 'package:grandatma_mobile/presentation/pages/customer/reservation/add_reservation_page.dart';

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

      result.fold(
          (l) => emit(ReservePaidFacilitiesError(message: l.message)),
          (r) => emit(
              ReservePaidFacilitiesSuccess(message: r.message.toString())));
    });

    on<DoMultipleReservePaidFacilities>((event, emit) async {
      emit(ReservePaidFacilitiesLoading());

      try{
        await Future.wait([
          for (var element in event.paidFacilities)
            _paidFacilitiesRepository.addPaidFacilities(
                event.idReservasi, element.id, element.unitCount)
        ]).whenComplete(() => emit(ReservePaidFacilitiesSuccess(message: "Success")))
            .onError((error, stackTrace) => throw Exception(error.toString()))
            .catchError((ex) => throw ex);
      }catch(e){
        emit(ReservePaidFacilitiesError(message: e.toString()));
      }



      // Future.forEach(event.paidFacilities, (element) async {
      //   await _paidFacilitiesRepository.addPaidFacilities(
      //       event.idReservasi, element.id, element.unitCount);
      // })
      //
      //     .whenComplete(() => emit(ReservePaidFacilitiesSuccess(message: "Success")))
      //     .onError((error, stackTrace) =>
      //         emit(ReservePaidFacilitiesError(message: error.toString())));

      // final result = await _paidFacilitiesRepository.addPaidFacilities(
      //     event.idReservasi, event.paidFacilityId, event.jumlahUnit);

      // result.fold((l) => emit(ReservePaidFacilitiesError(message: l.message)),
      //         (r) => emit(ReservePaidFacilitiesSuccess(message: r.message.toString())));
    });
  }
}
