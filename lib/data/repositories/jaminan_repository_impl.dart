import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grandatma_mobile/common/failure.dart';
import 'package:grandatma_mobile/data/sources/remote/jaminan_remote_data_source.dart';
import 'package:grandatma_mobile/domain/entities/jaminan/Jaminan.dart';
import 'package:grandatma_mobile/domain/entities/jaminan/pay_jaminan.dart';
import 'package:grandatma_mobile/domain/repositories/jaminan_respotory.dart';

import '../../common/exception.dart';

class JaminanRepositoryImpl implements JaminanRepository{

  final JaminanRemoteDataSource jaminanRemoteDataSource;

  JaminanRepositoryImpl({required this.jaminanRemoteDataSource});

  @override
  Future<Either<Failure, PayJaminan>> doPayJaminan(String id, int nominal, String rekening) async {
    try{
      final result = await jaminanRemoteDataSource.payJaminan(id, nominal, rekening);

      if(result.error){
        print(result);
        throw ServerException(result.message);
      }

      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }

  }

  @override
  Future<Either<Failure, List<Jaminan>>> getJaminan()async {
    try{
      final result = await jaminanRemoteDataSource.getJaminan();
      return Right(result.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }
  }
  
}