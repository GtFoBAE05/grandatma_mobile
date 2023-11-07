import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grandatma_mobile/domain/entities/paid_facilities/get_paid_facilities.dart';

import '../../../../../domain/repositories/paid_facilities_repository.dart';

part 'get_paid_facilities_event.dart';

part 'get_paid_facilities_state.dart';

class GetPaidFacilitiesBloc
    extends Bloc<GetPaidFacilitiesEvent, GetPaidFacilitiesState> {
  final PaidFacilitiesRepository _paidFacilitiesRepository;

  GetPaidFacilitiesBloc(this._paidFacilitiesRepository)
      : super(GetPaidFacilitiesInitial()) {
    on<GetPaidFacilities>((event, emit) async {
      emit(GetPaidFacilitiesLoading());

      final result = await _paidFacilitiesRepository.getPaidFacilities();

      result.fold((l) => emit(GetPaidFacilitiesError(message: l.message)), (
          r) => emit(GetPaidFacilitiesSuccess(paidFacilities: r)));
    });
  }
}
