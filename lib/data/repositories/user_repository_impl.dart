

import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grandatma_mobile/common/failure.dart';
import 'package:grandatma_mobile/domain/entities/user/UserEditProfile.dart';
import 'package:grandatma_mobile/domain/entities/auth/user_change_password.dart';
import 'package:grandatma_mobile/domain/repositories/user_repository.dart';

import '../../common/exception.dart';
import '../../domain/entities/user/UserDetail.dart';
import '../sources/remote/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository{

  final UserRemoteDataSource userRemoteDataSource;

  UserRepositoryImpl({required this.userRemoteDataSource});

  @override
  Future<Either<Failure, bool>> checkAccessToken() async {
    try{
      final response = await userRemoteDataSource.checkAccessToken();
      return Right(response);
    } on DioException catch (e) {
      return Left(ServerFailure(e.response as String));
    }
  }

  @override
  Future<Either<Failure, UserDetail>> getUserDetail() async {
    try{
      final result = await userRemoteDataSource.getUserDetail();
      return Right(result.data.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }
  }

  @override
  Future<Either<Failure, UserEditProfile>> doEditProfile(String name, String email, String username, String notelp) async {
    try{
      final result = await userRemoteDataSource.editProfile(name, email, username, notelp);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }
  }



}