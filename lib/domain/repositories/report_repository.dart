import 'package:dartz/dartz.dart';
import 'package:grandatma_mobile/domain/entities/report/new_customer_report.dart';
import 'package:grandatma_mobile/domain/entities/report/top_customer_report.dart';

import '../../common/failure.dart';

abstract class ReportRepository{
  Future<Either<Failure,List<Map<String,int>>>> getNewCustomerReport(String year);
  Future<Either<Failure,List<TopCustomerReportData>>> getTopCustomerReport(String year);
}