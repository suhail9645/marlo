part of 'search_cubit.dart';


 abstract class SearchState {}

 class SearchInitial extends SearchState {}

 class SearchResult extends SearchState{
final  List<Transaction>searchResult;

  SearchResult({required this.searchResult});
 }




