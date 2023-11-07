import 'package:dartz/dartz.dart';
import 'package:grandatma_mobile/data/models/jaminan/jaminan_model.dart';
import 'package:grandatma_mobile/data/models/reservation/add_reservation_model.dart';
import 'package:grandatma_mobile/domain/entities/reservation/add_reservation.dart';

import '../../common/failure.dart';
import '../../data/models/room/check_available_room_model.dart';
import '../entities/reservation/check_available_room.dart';

abstract class ReservationRepository {
  Future<Either<Failure, AddReservation>> addReservation(
      int idKamar,
      String tanggalCheckin,
      String tanggalCheckout,
      int jumlahDewasa,
      int jumlahAnak,
      String nomorRekening,
      String pilihanKasur);
}
