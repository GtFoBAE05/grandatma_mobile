
import 'package:dartz/dartz.dart';
import 'package:grandatma_mobile/common/failure.dart';
import 'package:grandatma_mobile/domain/entities/paid_facilities/add_paid_facilities.dart';
import 'package:grandatma_mobile/domain/entities/transaction/transaction_detail.dart';
import 'package:grandatma_mobile/domain/entities/transaction/transaction_history.dart';

import '../entities/transaction/cancel_transaction.dart';
import '../entities/transaction/cancel_transaction.dart';
import '../entities/transaction/cancel_transaction.dart';
import '../entities/transaction/cancel_transaction.dart';
import '../entities/transaction/transaction_can_cancel.dart';

abstract class TransactionRepository{
  Future<Either<Failure,List<TransactionHistory>>> getTransactionHistory();

  Future<Either<Failure,TransactionDetail>> getTransactionDetail(String id);

  Future<Either<Failure,List<TransactionCanCancel>>> getTransactionCanCancel();

  Future<Either<Failure,List<TransactionCanCancel>>> searchTransactionCanCancel(String id);

  Future<Either<Failure,CancelTransaction>> doCancelTransaction(String id);

}