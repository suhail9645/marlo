import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marlo/logic/filter/filter_cubit.dart';
import 'package:marlo/logic/filter_bloc/filter_bloc.dart';
import 'package:marlo/presentation/const/list.dart';
import 'package:marlo/presentation/const/widget.dart';
import 'package:marlo/presentation/screens/transaction_section/widget/status_filter.dart';
import 'package:marlo/presentation/screens/transaction_section/widget/time_filter.dart';

import '../../../../data_layer/model/transactions/datum.dart';
import '../../../../logic/search_cubit/search_cubit.dart';
import 'amout_filter.dart';
import 'currency_filter.dart';
import 'money_filter.dart';

class FilterBottermSheet extends StatelessWidget {
  const FilterBottermSheet({
    super.key,
    required this.allTransactions,
  });
  final List<Transaction> allTransactions;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screeHeight = screenSize.height;
    return Container(
      height: screeHeight - 70,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFFF7F7F7),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Padding(
        padding:
            EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        child: Column(
          children: [
            spaceForheight20,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 6,
                  width: 60,
                  decoration: BoxDecoration(
                    color: const Color(
                      0xFFC6EBF6,
                    ),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ],
            ),
            spaceForheight20,
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Filter',
                            style: GoogleFonts.heebo(
                                fontSize: 34, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Column(
                            children: [
                              spaceForheight10,
                              InkWell(
                                onTap: () {
                                  BlocProvider.of<FilterBloc>(context)
                                      .add(FilterCancelEvent());
                                  BlocProvider.of<SearchCubit>(context)
                                      .onSearch('', allTransactions);
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  'Clear',
                                  style: GoogleFonts.notoSans(
                                      fontSize: 15,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      spaceForheight10,
                      const FilterMoney(),
                      spaceForheight20,
                      BlocBuilder<StatusFilter, int>(
                        builder: (context, state) {
                          return FilterStatus(
                            state: state,
                          );
                        },
                      ),
                      spaceForheight20,
                      BlocBuilder<CurrencyFilter, CurrensyState>(
                        builder: (context, state) {
                          if (state is CurrensyStateList) {
                            return CurrencyContainer(
                                state: state, ctx: context);
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                      spaceForheight20,
                      BlocBuilder<DateFilter, int>(
                        builder: (context, state) {
                          return TimeRangeContainer(state: state, ctx: context);
                        },
                      ),
                      spaceForheight20,
                      const AmoutFilter(),
                      spaceForheight20,
                      FilterButton(
                        text: 'Cancel',
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      spaceForheight10,
                      FilterButton(
                        text: 'Apply',
                        onTap: () {
                          List<String> applyedCurrencies = [];
                          final state = BlocProvider.of<CurrencyFilter>(context)
                              .state as CurrensyStateList;
                          for (int i = 0; i < state.values.length; i++) {
                            if (state.values[i]) {
                              if (i == 0) {
                                applyedCurrencies = filterCurrencies;
                                break;
                              } else {
                                applyedCurrencies.add(filterCurrencies[i - 1]);
                              }
                            }
                          }
                          BlocProvider.of<FilterBloc>(context).add(
                              FilterImplementEvent(
                                  money: filterMoneyInAndOutOptions[
                                      BlocProvider.of<MoneyFilter>(context)
                                          .state],
                                  status: filterStatuses[
                                      BlocProvider.of<StatusFilter>(context)
                                          .state],
                                  currencies: applyedCurrencies,
                                  timeRange: '1 Week',
                                  minAmount: 0,
                                  maxAmout: 5000));

                          Navigator.pop(context);
                        },
                      ),
                      spaceForheight20,
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
