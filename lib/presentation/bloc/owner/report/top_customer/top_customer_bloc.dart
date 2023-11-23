import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/entities/report/top_customer_report.dart';
import '../../../../../domain/repositories/report_repository.dart';

part 'top_customer_event.dart';
part 'top_customer_state.dart';

class TopCustomerBloc extends Bloc<TopCustomerEvent, TopCustomerState> {
  final ReportRepository _reportRepository;

  TopCustomerBloc(this._reportRepository) : super(TopCustomerInitial()) {
    on<fetchTopCustomer>((event, emit)async {
      emit(TopCustomerLoading());
      final result = await _reportRepository.getTopCustomerReport(event.year);
        result.fold(
          (l) => emit(TopCustomerError(message: l.message)),
          (r) => emit(TopCustomerSuccess(topCustomers: r)),
        );
    });
  }
}
