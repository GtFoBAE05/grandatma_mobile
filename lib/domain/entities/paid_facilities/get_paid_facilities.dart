import 'package:equatable/equatable.dart';

class PaidFacilities extends Equatable {
  PaidFacilities({
    required this.id,
    required this.namaFasilitas,
    required this.harga,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String? namaFasilitas;
  final int? harga;
  final DateTime? createdAt;
  final DateTime? updatedAt;


  @override
  List<Object?> get props => [
    id, namaFasilitas, harga, createdAt, updatedAt, ];

}