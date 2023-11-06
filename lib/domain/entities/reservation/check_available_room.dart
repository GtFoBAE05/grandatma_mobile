import 'package:equatable/equatable.dart';

class Room extends Equatable {
  Room({
    required this.id,
    required this.nomorKamar,
    required this.idTipeKamar,
    required this.namaTipe,
    required this.statusKamar,
    required this.idSeason,
    required this.tarif,
  });

  final int? id;
  final String? nomorKamar;
  final int? idTipeKamar;
  final String? namaTipe;
  final String? statusKamar;
  final int? idSeason;
  final int? tarif;

  @override
  List<Object?> get props => [
    id, nomorKamar, idTipeKamar, namaTipe, statusKamar, idSeason, tarif, ];

}