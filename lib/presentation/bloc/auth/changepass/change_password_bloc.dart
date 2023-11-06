import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../domain/repositories/auth_repository.dart';

part 'change_password_event.dart';
part 'change_password_state.dart';

class ChangePasswordBloc extends Bloc<ChangePasswordEvent, ChangePasswordState> {

  final AuthRepository _authRepositoryImpl;

  ChangePasswordBloc(this._authRepositoryImpl) : super(ChangePasswordInitial()) {
    on<doChangePassword>((event, emit) async {
      emit(ChangePasswordLoading());

      final result = await _authRepositoryImpl.changeUserPassword(event.password);

      result.fold((l) => emit(ChangePasswordError(message: l.message)), (r) {

        emit(ChangePasswordSuccess());
      });
    });
  }
}
