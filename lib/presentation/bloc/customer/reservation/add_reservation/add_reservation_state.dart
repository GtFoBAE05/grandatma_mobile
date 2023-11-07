part of 'add_reservation_bloc.dart';

abstract class AddReservationState extends Equatable {
  const AddReservationState();

  @override
  List<Object> get props => [];
}

class AddReservationInitial extends AddReservationState {}
class AddReservationLoading extends AddReservationState {}
class AddReservationSuccess extends AddReservationState {
  final String idReservasi;

  AddReservationSuccess({required this.idReservasi});
}
class AddReservationError extends AddReservationState {
  final String message;

  AddReservationError({required this.message});
}
