import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:grandatma_mobile/common/failure.dart';
import 'package:grandatma_mobile/domain/entities/report/new_customer_report.dart';
import 'package:grandatma_mobile/domain/entities/report/top_customer_report.dart';
import 'package:grandatma_mobile/domain/repositories/report_repository.dart';

import '../../common/exception.dart';
import '../sources/remote/report_remote_data_source.dart';

class ReportRepositoryImpl implements ReportRepository{
  
  final ReportRemoteDataSource reportRemoteDataSource;

  ReportRepositoryImpl({required this.reportRemoteDataSource});
  
  @override
  Future<Either<Failure, List<Map<String,int>>>> getNewCustomerReport(String year) async {
    try {
      final result = await reportRemoteDataSource.getNewCustomerReport(year);

      return Right(result.toEntity().data);
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }
  }

  @override
  Future<Either<Failure, List<TopCustomerReportData>>> getTopCustomerReport(String year)async {
    try {
      final result = await reportRemoteDataSource.getTopCustomerReport(year);

      return Right(result.data.map((e) => e.toEntity()).toList());
    } on ServerException {
      return Left(ServerFailure(''));
    } on SocketException {
      return Left(ConnectionFailure('Failed to connect to the network'));
    } on DioException catch (e) {
      return Left(ServerFailure(e.response!.data['message']));
    }
  }
  
}