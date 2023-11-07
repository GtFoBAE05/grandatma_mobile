part of 'reserve_paid_facilities_bloc.dart';

abstract class ReservePaidFacilitiesState extends Equatable {
  const ReservePaidFacilitiesState();

  @override
  List<Object> get props => [];
}

class ReservePaidFacilitiesInitial extends ReservePaidFacilitiesState {}
class ReservePaidFacilitiesLoading extends ReservePaidFacilitiesState {}
class ReservePaidFacilitiesSuccess extends ReservePaidFacilitiesState {
  final String message;

  ReservePaidFacilitiesSuccess({required this.message});

}
class ReservePaidFacilitiesError extends ReservePaidFacilitiesState {
  final String message;

  ReservePaidFacilitiesError({required this.message});
}

