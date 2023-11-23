import 'package:dio/dio.dart';
import 'package:grandatma_mobile/data/models/report/top_customer_report_model.dart';

import '../../../common/exception.dart';
import '../../models/report/new_customer_report_model.dart';

abstract class ReportRemoteDataSource{
  Future<NewCustomerReportModel> getNewCustomerReport(String year);
  Future<TopCustomerReportModel> getTopCustomerReport(String year);

}

class ReportRemoteDataSourceImpl implements ReportRemoteDataSource{

  final Dio dio;

  ReportRemoteDataSourceImpl({required this.dio});

  @override
  Future<NewCustomerReportModel> getNewCustomerReport(String year) async {
    final response = await dio.get("report/newcustomerbyyear/$year", );

    if (response.statusCode == 200) {
      return NewCustomerReportModel.fromJson(response.data);
    } else {
      throw ServerException(response.data['message']);
    }
  }

  @override
  Future<TopCustomerReportModel> getTopCustomerReport(String year) async {
    final response = await dio.get("report/topcustomer/$year", );

    if (response.statusCode == 200) {
      return TopCustomerReportModel.fromJson(response.data);
    } else {
      throw ServerException(response.data['message']);
    }
  }

}