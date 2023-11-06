import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/repositories/auth_repository_impl.dart';
import '../../../../domain/entities/auth/signin.dart';
import '../../../../domain/repositories/auth_repository.dart';

part 'signin_event.dart';
part 'signin_state.dart';

class SigninBloc extends Bloc<SigninEvent, SigninState> {

  final AuthRepository _authRepositoryImpl;


  SigninBloc(this._authRepositoryImpl) : super(SigninInitial())  {
    on<FetchSignin>((event, emit) async {
      emit(SigninLoading());

      final result = await _authRepositoryImpl.login(event.email, event.password);
      SharedPreferences prefs = await SharedPreferences.getInstance();
      
      result.fold((l) => emit(SigninError(message: l.message)), (r) {
        prefs.setString('token', r.token);
        prefs.setString('role', r.role);
        emit(SigninSuccess(signin: r));
      });
    });
  }
}
