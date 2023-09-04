part of 'filter_bloc.dart';

class FilterState {}

class FilterInitial extends FilterState {}

class FilterImplemntState extends FilterState {
  final String? money;
  final String? status;
  final List<String>? currencies;
  final String? timeRange;
  final int? minAmount;
  final int? maxAmout;
  
  FilterImplemntState(
      {required this.money,
      required this.status,
      required this.currencies,
      required this.timeRange,
      required this.minAmount,
      required this.maxAmout});

      Map<String, dynamic> toMap(FilterImplemntState state) {
    return {
      'money': money,
      'status': status,
      'currencies': currencies,
      'timeRange': timeRange,
      'minAmount': minAmount,
      'maxAmount': maxAmout,
    };
  }

  List<List<String>>itemsToshow(){
   List<List<String>>applyedItems=[];
    if(currencies!=null){
      applyedItems.add(['currencies','Currencies-${currencies!.length}']);
    }
    if(money!=null){
      applyedItems.add(['money',money!]);
    }
     if(status!=null){
      applyedItems.add(['status',status!]);
    }
     if(timeRange!=null){
      applyedItems.add(['timeRange',timeRange!]);
    }
     if(minAmount!=null){
      applyedItems.add(['amount','$minAmount-$maxAmout']);
    }
    return applyedItems;
  }
}
