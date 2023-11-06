part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final UserDetail userDetail;
  ProfileSuccess({required this.userDetail});
}

class ProfileError extends ProfileState {
  final String message;

  ProfileError({required this.message});
}



class ProfileLogout extends ProfileState {}