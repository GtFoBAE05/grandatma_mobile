import 'package:equatable/equatable.dart';

class RoomDetail extends Equatable {
  RoomDetail({
    required this.id,
    required this.namaTipe,
    required this.pilihanTempatTidur,
    required this.fasilitas,
    required this.deskripsi,
    required this.rincianKamar,
    required this.tarif,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? namaTipe;
  final String? pilihanTempatTidur;
  final String? fasilitas;
  final String? deskripsi;
  final String? rincianKamar;
  final int? tarif;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [
    id, namaTipe, pilihanTempatTidur, fasilitas, deskripsi, rincianKamar, tarif, createdAt, updatedAt, ];

}