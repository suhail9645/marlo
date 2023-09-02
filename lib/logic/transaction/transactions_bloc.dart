import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:marlo/data_layer/data_provider/auth.dart';
import 'package:marlo/data_layer/data_provider/transaction.dart';
import 'package:marlo/data_layer/model/transactions/datum.dart';
import 'package:marlo/data_layer/repositories/transaction_repo.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'transactions_event.dart';
part 'transactions_state.dart';

class TransactionsBloc extends Bloc<TransactionsEvent, TransactionsState> {
  TransactionsBloc() : super(TransactionsInitial()) {
    on<TransactionsInitialEvent>(transactionsInitialEvent);
  }

  Future<void> transactionsInitialEvent(
      TransactionsInitialEvent event, Emitter<TransactionsState> emit) async {
    SharedPreferences shrd = await SharedPreferences.getInstance();
    String? access = shrd.getString('access');
    if (access == null) {
      final accessOrError = await AuthUser().loginUser();
      if (accessOrError.isLeft) {
        emit(TrasactionGetErrorState(error: accessOrError.left.error));
      } else {
        access = accessOrError.right;
      }
    }
   final errorOrSuccess=await TransactionRepo().getAllTransactions(access!);
   if(errorOrSuccess.isLeft){
    emit(TrasactionGetErrorState(error: errorOrSuccess.left.error));
   }else{
    emit(TrasactionGetSuccessState(allTransactions: errorOrSuccess.right));
   }
  }
}
