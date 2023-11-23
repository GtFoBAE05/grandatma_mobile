import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/report/new_customer_report.dart';
import '../../../../../domain/repositories/report_repository.dart';

part 'new_customer_event.dart';
part 'new_customer_state.dart';

class NewCustomerBloc extends Bloc<NewCustomerEvent, NewCustomerState> {

  final ReportRepository _reportRepository;

  NewCustomerBloc(this._reportRepository) : super(NewCustomerInitial()) {
    on<fetchNewCustomer>((event, emit) async {
      emit(NewCustomerLoading());
      final result = await _reportRepository.getNewCustomerReport(event.year);
      result.fold(
        (l) => emit(NewCustomerError(message: l.message)),
        (r) => emit(NewCustomerSuccess(newCustomers: r)),
      );
    });
  }
}
