import 'package:equatable/equatable.dart';

class AddReservation extends Equatable {
  AddReservation({
    required this.idReservasi,
  });

  final String? idReservasi;


  @override
  List<Object?> get props => [
    idReservasi, ];

}