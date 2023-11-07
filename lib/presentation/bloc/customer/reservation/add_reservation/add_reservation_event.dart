part of 'add_reservation_bloc.dart';

abstract class AddReservationEvent extends Equatable {
  const AddReservationEvent();
}

class DoAddReservation extends AddReservationEvent {
  final int idKamar;

  final String tanggalCheckin;

  final String tanggalCheckout;

  final int jumlahDewasa;

  final int jumlahAnak;

  final String nomorRekening;

  final String pilihanKasur;


  DoAddReservation(
      {required this.idKamar, required this.tanggalCheckin, required this.tanggalCheckout, required this.jumlahDewasa, required this.jumlahAnak, required this.nomorRekening, required this.pilihanKasur});

  @override
  // TODO: implement props
  List<Object?> get props => [idKamar, tanggalCheckin, tanggalCheckout, jumlahDewasa, jumlahAnak, nomorRekening, pilihanKasur];
}
