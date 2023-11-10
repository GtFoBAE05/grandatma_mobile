
import 'package:dio/dio.dart';
import 'package:grandatma_mobile/data/models/transaction/cancel_transaction_response_model.dart';
import 'package:grandatma_mobile/data/models/transaction/transaction_can_cancel_response_model.dart';
import 'package:grandatma_mobile/data/models/transaction/transaction_detail_model.dart';
import 'package:grandatma_mobile/data/models/transaction/transaction_history_model.dart';

import '../../../common/exception.dart';

abstract class TransactionRemoteDataSource{
  Future<List<TransactionHistoryDataModel>> getTransactionHistory();
  Future<TransactionDetailModel> getTransactionDetail(String id);
  Future<List<TransactionCanCancelModel>> getTransactionCancel();
  Future<List<TransactionCanCancelModel>> searchTransactionCancel(String id);
  Future<CancelTransactionResponseModel> doCancelTransaction(String id);

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

  @override
  Future<CancelTransactionResponseModel> doCancelTransaction(String id) async{
    final response = await dio.put("transaksi/do/batalstatus/$id");

    if(response.statusCode == 200) {
      return CancelTransactionResponseModel.fromJson(response.data);
    } else {
      throw ServerException(response.data['message']);
    }
  }

  @override
  Future<List<TransactionCanCancelModel>> getTransactionCancel() async {
    final response = await dio.get("transaksi/my/search/batal");

    if(response.statusCode == 200) {
      return TransactionCanCancelResponseModel.fromJson(response.data).data;
    } else {
      throw ServerException(response.data['message']);
    }
  }

  @override
  Future<List<TransactionCanCancelModel>> searchTransactionCancel(String id) async {
    final response = await dio.get("transaksi/my/search/batal",queryParameters: {
      "id": id
    });

    if(response.statusCode == 200) {
      return TransactionCanCancelResponseModel.fromJson(response.data).data;
    } else {
      throw ServerException(response.data['message']);
    }
  }
}