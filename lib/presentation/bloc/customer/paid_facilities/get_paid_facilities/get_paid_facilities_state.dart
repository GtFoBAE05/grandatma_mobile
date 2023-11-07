part of 'get_paid_facilities_bloc.dart';

abstract class GetPaidFacilitiesState extends Equatable {
  const GetPaidFacilitiesState();
  @override
  List<Object> get props => [];
}

class GetPaidFacilitiesInitial extends GetPaidFacilitiesState {}
class GetPaidFacilitiesLoading extends GetPaidFacilitiesState {}
class GetPaidFacilitiesSuccess extends GetPaidFacilitiesState {
  final List<PaidFacilities> paidFacilities;

  GetPaidFacilitiesSuccess({required this.paidFacilities});
}
class GetPaidFacilitiesError extends GetPaidFacilitiesState {
  final String message;

  GetPaidFacilitiesError({required this.message});
}