import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../data/repositories/auth_repository_impl.dart';
import '../../../../domain/repositories/auth_repository.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {

  final AuthRepository _authRepositoryImpl;

  SignupBloc(this._authRepositoryImpl) : super(SignupInitial()) {
    on<FetchSignup>((event, emit) async {
      emit(SignupLoading());

      final result = await _authRepositoryImpl.register(event.name, event.email, event.username, event.notelp, event.password);

      result.fold((l) => emit(SignupError(message: l.message)), (r) => emit(SignupSuccess()));
    });
  }
}
