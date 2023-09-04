import 'package:bloc/bloc.dart';
import 'package:marlo/data_layer/model/transactions/datum.dart';
import 'package:marlo/logic/filter_bloc/filter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:intl/intl.dart';
part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  onSearch(String query, List<Transaction> allTransactions) {
    List<Transaction> searchResult = [];
    if (query == '') {
      searchResult.addAll(allTransactions);
      emit(SearchResult(searchResult: searchResult));
    }

    for (var element in allTransactions) {
      if (element.description!.toLowerCase().contains(query.toLowerCase())) {
        searchResult.add(element);
      }
    }
    emit(SearchResult(searchResult: searchResult));
  }

  onFilter(FilterImplemntState filterState, List<Transaction> allTransactions) {
    List<Transaction> searchResult = [];

   for (var element in allTransactions) {
    bool flag=false;
     if(filterState.currencies != null){
       for (var currency in filterState.currencies!) {
        if(currency==element.currency1){
          flag=true;
        }
      }
      if(!flag){
        continue;
      }
     }
      if (element.status == filterState.status) {
          flag=true;
        }else{
          continue;
        }
     if (NumberFormat().parse(element.amount!.replaceAll(',','')) >= 10000 &&
            NumberFormat().parse(element.amount!.replaceAll(',','')) <=100000) {
          flag=true;
        }else{
          continue;
        }
        searchResult.add(element);
   }

    

    emit(SearchResult(searchResult: searchResult));
  }
}
