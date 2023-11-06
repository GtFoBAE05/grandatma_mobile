part of 'signin_bloc.dart';

abstract class SigninEvent extends Equatable {
  const SigninEvent();
}

class FetchSignin extends SigninEvent {
  final String email;
  final String password;

  const FetchSignin({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
