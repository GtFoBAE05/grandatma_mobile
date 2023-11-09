import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grandatma_mobile/common/failure.dart';
import 'package:grandatma_mobile/data/sources/remote/paid_facilities_remote_data_source.dart';
import 'package:grandatma_mobile/domain/entities/paid_facilities/add_paid_facilities.dart';
import 'package:grandatma_mobile/domain/entities/paid_facilities/get_paid_facilities.dart';
import 'package:grandatma_mobile/domain/repositories/paid_facilities_repository.dart';

import '../../common/exception.dart';

class PaidFacilitiesRepositoryImpl implements PaidFacilitiesRepository {
  final PaidFacilitiesRemoteDataSource paidFacilitiesRemoteDataSource;

  PaidFacilitiesRepositoryImpl({required this.paidFacilitiesRemoteDataSource});

  @override
  Future<Either<Failure, AddPaidFacilities>> addPaidFacilities(
      String id, int idFasilitas, int jumlahUnit) async {
    try {
      final result = await paidFacilitiesRemoteDataSource.addPaidFacilities(
          id, idFasilitas, jumlahUnit);

      print(result);
      if (result.error) {
        print(result);
        throw ServerException(result.message);
      }

      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }
  }

  @override
  Future<Either<Failure, List<PaidFacilities>>> getPaidFacilities() async {
    try {
      final result = await paidFacilitiesRemoteDataSource.getPaidFacilities();

      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }
  }
}
