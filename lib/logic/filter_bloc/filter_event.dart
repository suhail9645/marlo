part of 'filter_bloc.dart';

class FilterEvent {}

class FilterImplementEvent extends FilterEvent{
  final String? money;
  final String? status;
  final List<String>? currencies;
  final String? timeRange;
  final int? minAmount;
  final int? maxAmout;

  FilterImplementEvent(
      {required this.money,
      required this.status,
      required this.currencies,
      required this.timeRange,
      required this.minAmount,
      required this.maxAmout});
}


class FilterCancelEvent extends FilterEvent{}

class FilterEditEvent extends FilterEvent{
  final String value;
  final FilterImplemntState state;

  FilterEditEvent({required this.value,required this.state});
  
}
