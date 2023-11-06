part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();
}

class FetchUserDetail extends ProfileEvent{
  @override
  List<Object?> get props => [];

}

class doLogout extends ProfileEvent{
  @override
  List<Object?> get props => [];

}
