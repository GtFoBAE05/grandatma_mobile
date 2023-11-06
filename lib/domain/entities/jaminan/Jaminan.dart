import 'package:equatable/equatable.dart';

class Jaminan extends Equatable {
  Jaminan({
    required this.id,
    required this.idReservasi,
    required this.nominal,
    required this.totalPembayaran,
    required this.statusLunas,
  });

  final int? id;
  final String? idReservasi;
  final int? nominal;
  final int? totalPembayaran;
  final bool? statusLunas;


  @override
  List<Object?> get props => [
    id, idReservasi, nominal, totalPembayaran, statusLunas, ];

}
