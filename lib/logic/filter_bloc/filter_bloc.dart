import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc() : super(FilterInitial()) {
    on<FilterCancelEvent>(filterCancelEvent);
    on<FilterImplementEvent>(filterImplementEvent);
    on<FilterEditEvent>(filterEditEvent);
  }

  void filterCancelEvent(FilterCancelEvent event, Emitter<FilterState> emit) {
    emit(FilterInitial());
  }

  void filterImplementEvent(
      FilterImplementEvent event, Emitter<FilterState> emit) async {
    emit(
      FilterImplemntState(
          money: event.money,
          status: event.status,
          currencies: event.currencies,
          timeRange: event.timeRange,
          minAmount: event.minAmount,
          maxAmout: event.maxAmout),
    );
  }

  FutureOr<void> filterEditEvent(
      FilterEditEvent event, Emitter<FilterState> emit) {
    if (event.value == 'currencies') {
      emit(FilterImplemntState(
          money: event.state.money,
          status: event.state.status,
          currencies:null,
          timeRange: event.state.timeRange,
          minAmount: event.state.minAmount,
          maxAmout: event.state.maxAmout));
    }
     if (event.value == 'money') {
      emit(FilterImplemntState(
          money: null,
          status: event.state.status,
          currencies:event.state.currencies,
          timeRange: event.state.timeRange,
          minAmount: event.state.minAmount,
          maxAmout: event.state.maxAmout));
    }
     if (event.value=='status') {
      emit(FilterImplemntState(
          money: event.state.money,
          status: null,
          currencies:event.state.currencies,
          timeRange: event.state.timeRange,
          minAmount: event.state.minAmount,
          maxAmout: event.state.maxAmout));
    }
     if (event.value== 'timeRange') {
      emit(FilterImplemntState(
          money: event.state.money,
          status: event.state.status,
          currencies:event.state.currencies,
          timeRange: null,
          minAmount: event.state.minAmount,
          maxAmout: event.state.maxAmout));
    }
    if (event.value == 'amount') {
      emit(FilterImplemntState(
          money: event.state.money,
          status: event.state.status,
          currencies:event.state.currencies,
          timeRange: event.state.timeRange,
          minAmount: null,
          maxAmout: null));
    }
    
  }
}
