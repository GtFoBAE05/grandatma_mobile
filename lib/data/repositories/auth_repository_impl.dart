
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grandatma_mobile/common/exception.dart';
import 'package:grandatma_mobile/common/failure.dart';
import 'package:grandatma_mobile/domain/entities/auth/signin.dart';
import 'package:grandatma_mobile/domain/entities/auth/signup.dart';
import 'package:grandatma_mobile/domain/repositories/auth_repository.dart';

import '../../domain/entities/auth/user_change_password.dart';
import '../sources/remote/auth_remote_data_source.dart';

class AuthRepositoryImpl implements AuthRepository{

  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({required this.authRemoteDataSource});

  @override
  Future<Either<Failure, Signin>> login(String email, String password) async {
    try{
      final result = await authRemoteDataSource.login(email, password);

      if(result.error){
        print(result);
        throw ServerException("Email atau password salah");
      }

      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    }on DioException catch (e) {
      print(e);
      return Left(ServerFailure(e.response!.data['pesan']));
    }
  }

  @override
  Future<Either<Failure, Signup>> register(String nama, String email, String username, String phone, String password) async {
    try{
      final result = await authRemoteDataSource.register(nama, email, username, phone, password);
      return Right(result.toEntity());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['pesan']));
    }
  }

  @override
  Future<Either<Failure, UserChangePassword>> changeUserPassword(String password) async {
    try{
      final result = await authRemoteDataSource.changeUserPassword(password);
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