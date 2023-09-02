part of 'transactions_bloc.dart';

abstract class TransactionsState {}

class TransactionsInitial extends TransactionsState {}

class TrasactionGetSuccessState extends TransactionsState {
  final List<Transaction> allTransactions;

  TrasactionGetSuccessState({required this.allTransactions});
}

class TrasactionGetLoadingState extends TransactionsState {}

class TrasactionGetErrorState extends TransactionsState {
  final String error;

  TrasactionGetErrorState({required this.error});
}
