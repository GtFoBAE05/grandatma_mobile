import 'package:dartz/dartz.dart';
import 'package:grandatma_mobile/data/models/jaminan/jaminan_model.dart';
import 'package:grandatma_mobile/domain/entities/jaminan/Jaminan.dart';
import 'package:grandatma_mobile/domain/entities/paid_facilities/add_paid_facilities.dart';

import '../../common/failure.dart';
import '../entities/paid_facilities/get_paid_facilities.dart';

abstract class PaidFacilitiesRepository{
  Future<Either<Failure,AddPaidFacilities>> addPaidFacilities(String id, int idFasilitas, int jumlahUnit);
  Future<Either<Failure,List<PaidFacilities>>> getPaidFacilities();
}