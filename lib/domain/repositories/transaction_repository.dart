
import 'package:dartz/dartz.dart';
import 'package:grandatma_mobile/common/failure.dart';
import 'package:grandatma_mobile/domain/entities/transaction/transaction_detail.dart';
import 'package:grandatma_mobile/domain/entities/transaction/transaction_history.dart';

abstract class TransactionRepository{
  Future<Either<Failure,List<TransactionHistory>>> getTransactionHistory();

  Future<Either<Failure,TransactionDetail>> getTransactionDetail(String id);
}