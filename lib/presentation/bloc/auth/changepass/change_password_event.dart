part of 'change_password_bloc.dart';

abstract class ChangePasswordEvent extends Equatable {
  const ChangePasswordEvent();
}

class doChangePassword extends ChangePasswordEvent {
  final String password;

  doChangePassword({
    required this.password,
  });

  @override
  List<Object?> get props => [
    password, ];
}
