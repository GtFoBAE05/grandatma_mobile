
import 'package:dio/dio.dart';
import 'package:grandatma_mobile/data/models/transaction/transaction_detail_model.dart';
import 'package:grandatma_mobile/data/models/transaction/transaction_history_model.dart';

import '../../../common/exception.dart';

abstract class TransactionRemoteDataSource{
  Future<List<TransactionHistoryDataModel>> getTransactionHistory();
  Future<TransactionDetailModel> getTransactionDetail(String id);
}

class TransactionRemoteDataSourceImpl implements TransactionRemoteDataSource{

  final Dio dio;

  TransactionRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<TransactionHistoryDataModel>> getTransactionHistory() async{

    final response = await dio.get("transaksihistory");

    if(response.statusCode == 200) {
      return TransactionHistoryModel.fromJson(response.data).data;
    } else {
      throw ServerException(response.data['message']);
    }

  }

  @override
  Future<TransactionDetailModel> getTransactionDetail(String id) async {
    final response = await dio.get("transaksidetail/$id");

    if(response.statusCode == 200) {
      return TransactionDetailModel.fromJson(response.data);
    } else {
      throw ServerException(response.data['message']);
    }

  }
}