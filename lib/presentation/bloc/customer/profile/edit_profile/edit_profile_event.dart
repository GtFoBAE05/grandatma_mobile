part of 'edit_profile_bloc.dart';

abstract class EditProfileEvent extends Equatable {
  const EditProfileEvent();

}

class doEditProfile extends EditProfileEvent{
  final String name;
  final String email;
  final String phone;
  final String username;

  doEditProfile({required this.name, required this.email, required this.phone, required this.username});

  @override
  // TODO: implement props
  List<Object?> get props => [name,email,phone,username];
}
