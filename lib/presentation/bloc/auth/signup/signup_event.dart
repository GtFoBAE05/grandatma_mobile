part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();
}

class FetchSignup extends SignupEvent{
  final String name;
  final String email;
  final String username;
  final String notelp;
  final String password;

  const FetchSignup({required this.name, required this.email, required this.username, required this.notelp, required this.password, });

  @override
  List<Object> get props => [name,email,username,notelp,password];
}
