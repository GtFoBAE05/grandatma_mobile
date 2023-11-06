import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grandatma_mobile/domain/entities/user/UserDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../domain/repositories/user_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {

  final UserRepository _userRepositoryImpl;

  ProfileBloc(this._userRepositoryImpl) : super(ProfileInitial()) {
    on<FetchUserDetail>((event, emit) async  {
      emit(ProfileLoading());

      final result = await _userRepositoryImpl.getUserDetail();

      result.fold((l) => emit(ProfileError(message: l.message)), (r) => emit(ProfileSuccess(userDetail: r)));

    });

    on<doLogout>((event, emit) async  {

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.clear();
      emit(ProfileLogout());
    });
  }
}
