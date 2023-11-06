import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../domain/repositories/user_repository.dart';

part 'edit_profile_event.dart';
part 'edit_profile_state.dart';

class EditProfileBloc extends Bloc<EditProfileEvent, EditProfileState> {

  final UserRepository _userRepositoryImpl;

  EditProfileBloc(this._userRepositoryImpl) : super(EditProfileInitial()) {
    on<doEditProfile>((event, emit) async{
      emit(EditProfileLoading());

      final result = await _userRepositoryImpl.doEditProfile(event.name, event.email, event.username, event.phone);

      result.fold((l) => emit(EditProfileError(message: l.message)), (r) => emit(EditProfileSuccess()));

    });
  }
}
