import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grandatma_mobile/common/failure.dart';
import 'package:grandatma_mobile/data/sources/remote/room_remote_data_source.dart';
import 'package:grandatma_mobile/domain/entities/reservation/check_available_room.dart';
import 'package:grandatma_mobile/domain/entities/room/room_detail.dart';
import 'package:grandatma_mobile/domain/repositories/room_repository.dart';

import '../../common/exception.dart';

class RoomRepositoryImpl implements RoomRepository{
  final RoomRemoteDataSource roomRemoteDataSource;

  RoomRepositoryImpl({required this.roomRemoteDataSource});

  @override
  Future<Either<Failure, List<Room>>> getAvailableRoom(String startDate, String endDate) async{
    try{
      final response = await roomRemoteDataSource.getAvailableRoom(startDate, endDate);

      return Right(response.map((e) => e.toEntity()).toList());
    }  on ServerException {
    return Left(ServerFailure(''));
    } on SocketException {
    return Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
    return Left(ServerFailure(e.response!.data['message']));
    }
  }

  @override
  Future<Either<Failure, RoomDetail>> getRoomDetail(int id) async{
    try{
      final response = await roomRemoteDataSource.getRoomDetail(id);
      return Right(response.toEntity());
    }on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }
  }

}