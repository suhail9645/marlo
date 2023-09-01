import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

class MoneyFilter extends Cubit<int> {
  MoneyFilter() : super(0);

  void onTap(int index) {
    emit(index);
  }
}

class StatusFilter extends Cubit<int> {
  StatusFilter() : super(0);

  void onTap(int index) {
    emit(index);
  }
}

class DateFilter extends Cubit<int> {
  DateFilter() : super(1);

  void onTap(int index) {
    emit(index);
  }
}

class CurrencyFilter extends Cubit<CurrensyState> {
  CurrencyFilter() : super(CurrensyStateList(List.filled(4, false)));

  void onTap(int index, List<bool> values, bool value) {
  if (index == 0) {
    values = List.filled(4, value);
  } else {
    values[index] = value;
    for (int i=1;i<values.length;i++) {
      if(!values[i]){
        values[0]=false;
        break;
      }else{
        values[0]=true;
      }
    }
    
  }

  emit(CurrensyStateList(values)); 
}

}

abstract class CurrensyState {
 
}
class CurrensyStateList extends CurrensyState{
  final List<bool> values;

  CurrensyStateList(this.values);
}
