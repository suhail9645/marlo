
import 'package:either_dart/either.dart';
import 'package:http/http.dart';
import 'package:marlo/data_layer/data_provider/transaction.dart';
import 'package:marlo/data_layer/model/error_model/error.dart';
import 'package:marlo/data_layer/model/transactions/datum.dart';
import 'package:marlo/data_layer/model/transactions/transactions.dart';

class TransactionRepo{
  Future<Either<ErrorModel,List<Transaction>>>getAllTransactions(String access)async{
    final successListOrError=await TransactionsImp().getAllTransactions(access);
    if(successListOrError.isLeft){
      return Left(successListOrError.left);
    }else{
     Transactions transactions=Transactions.fromJson(successListOrError.right.data);
     List<Transaction> allTransactions=[];
     for (Transaction element in transactions.data! ) {
       allTransactions.add(element);
     }
     return Right(allTransactions);
    }
  }
}