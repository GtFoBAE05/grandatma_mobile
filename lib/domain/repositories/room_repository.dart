import 'package:dartz/dartz.dart';
import 'package:grandatma_mobile/domain/entities/room/room_detail.dart';

import '../../common/failure.dart';
import '../entities/reservation/check_available_room.dart';

abstract class RoomRepository{
  Future<Either<Failure,RoomDetail>> getRoomDetail(int id);
  Future<Either<Failure,Room>> getAvailableRoom(String startDate, String endDate);
}