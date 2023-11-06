import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grandatma_mobile/common/failure.dart';
import 'package:grandatma_mobile/domain/entities/transaction/transaction_detail.dart';
import 'package:grandatma_mobile/domain/entities/transaction/transaction_history.dart';
import 'package:grandatma_mobile/domain/repositories/transaction_repository.dart';

import '../../common/exception.dart';
import '../sources/remote/transaction_remote_data_source.dart';

class TransactionRepositoryImpl implements TransactionRepository {
  final TransactionRemoteDataSource transactionRemoteDataSource;

  TransactionRepositoryImpl({required this.transactionRemoteDataSource});

  @override
  Future<Either<Failure, List<TransactionHistory>>>
      getTransactionHistory() async {
    try {
      final result = await transactionRemoteDataSource.getTransactionHistory();
      return Right(result.map((model) => model.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }
  }

  @override
  Future<Either<Failure, TransactionDetail>> getTransactionDetail(
      String id) async {
    try {
      final result = await transactionRemoteDataSource.getTransactionDetail(id);
      final mappedResult = TransactionDetail(
          data: result.data?.toEntity(),
          fasilitas: result.fasilitas.map((e) => e.toEntity()).toList());
      return Right(mappedResult);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['pesan']));
    }
  }
}
