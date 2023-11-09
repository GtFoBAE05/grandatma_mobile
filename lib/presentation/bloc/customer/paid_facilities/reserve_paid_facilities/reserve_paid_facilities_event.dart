part of 'reserve_paid_facilities_bloc.dart';

abstract class ReservePaidFacilitiesEvent extends Equatable {
  const ReservePaidFacilitiesEvent();
}

class DoReservePaidFacilities extends ReservePaidFacilitiesEvent {
  final String idReservasi;
  final int paidFacilityId;
  final int jumlahUnit;

  DoReservePaidFacilities({required this.idReservasi, required this.paidFacilityId, required this.jumlahUnit});

  @override
  List<Object> get props => [];
}

class DoMultipleReservePaidFacilities extends ReservePaidFacilitiesEvent {
  final List<ArgumentPaidFacilities> paidFacilities;
  final String idReservasi;

  DoMultipleReservePaidFacilities({required this.paidFacilities, required this.idReservasi});

  @override
  List<Object> get props => [];
}