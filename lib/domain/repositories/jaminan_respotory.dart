
import 'package:dartz/dartz.dart';
import 'package:grandatma_mobile/data/models/jaminan/jaminan_model.dart';
import 'package:grandatma_mobile/domain/entities/jaminan/Jaminan.dart';
import 'package:grandatma_mobile/domain/entities/jaminan/pay_jaminan.dart';

import '../../common/failure.dart';

abstract class JaminanRepository{
  Future<Either<Failure,List<Jaminan>>> getJaminan();

  Future<Either<Failure,PayJaminan>> doPayJaminan(String id, int nominal);
}