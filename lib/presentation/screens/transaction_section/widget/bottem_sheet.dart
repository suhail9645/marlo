import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marlo/logic/filter/filter_cubit.dart';
import 'package:marlo/logic/filter_bloc/filter_bloc.dart';
import 'package:marlo/presentation/const/list.dart';
import 'package:marlo/presentation/const/widget.dart';

import '../../../../data_layer/model/transactions/datum.dart';
import '../../../../logic/search_cubit/search_cubit.dart';

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
    double screenWidth = screenSize.width;
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
                                  BlocProvider.of<SearchCubit>(context).onSearch('', allTransactions);
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
                            return Container(
                              height: 290,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                        value: state.values[0],
                                        onChanged: (value) {
                                          BlocProvider.of<CurrencyFilter>(
                                                  context)
                                              .onTap(0, state.values, value!);
                                        },
                                      ),
                                      Text(
                                        'Currencies · 167',
                                        style: GoogleFonts.notoSans(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.w600,
                                        ),
                                      )
                                    ],
                                  ),
                                  ...List.generate(
                                    3,
                                    (index) => Row(
                                      children: [
                                        Checkbox(
                                          value: state.values[index + 1],
                                          onChanged: (value) {
                                            BlocProvider.of<CurrencyFilter>(
                                                    context)
                                                .onTap(index + 1, state.values,
                                                    value!);
                                          },
                                        ),
                                        Expanded(
                                          child: ListTile(
                                            contentPadding: EdgeInsets.all(0),
                                            leading: CircleAvatar(
                                              radius: 21,
                                              backgroundImage: NetworkImage(
                                                  currenyFlags[index]),
                                            ),
                                            title: Text(
                                              filterCurrencies[index],
                                              style: GoogleFonts.notoSans(
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                            subtitle: Text(
                                              'United States Dollar',
                                              style: GoogleFonts.notoSans(
                                                  fontSize: 11.0,
                                                  color: Color(0xFF979797)),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Row(
                                      children: [
                                        Text('See all accounts',
                                            style: GoogleFonts.notoSans(
                                                fontSize: 14,
                                                color: Color(0xFF0CABDF),
                                                fontWeight: FontWeight.w500)),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            );
                          } else {
                            return const SizedBox();
                          }
                        },
                      ),
                      spaceForheight20,
                      BlocBuilder<DateFilter, int>(
                        builder: (context, state) {
                          return Container(
                            padding: EdgeInsets.all(8),
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Time range',
                                  style: GoogleFonts.notoSans(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Row(
                                  children: List.generate(
                                    3,
                                    (index) => InkWell(
                                      onTap: () {
                                        BlocProvider.of<DateFilter>(context)
                                            .onTap(index);
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: index == state
                                                ? const Color.fromARGB(
                                                    255, 208, 236, 245)
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          child: Text(
                                            filterTimeRanges[index],
                                            style: GoogleFonts.notoSans(
                                                fontSize: 14,
                                                color: index == state
                                                    ? const Color(0xFF0CABDF)
                                                    : const Color(0xFF75808A)),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: List.generate(
                                    2,
                                    (index) => InkWell(
                                      onTap: () {
                                        BlocProvider.of<DateFilter>(context)
                                            .onTap(index + 3);
                                      },
                                      child: Container(
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: index + 3 == state
                                                ? const Color.fromARGB(
                                                    255, 208, 236, 245)
                                                : Colors.transparent,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 4),
                                          child: Text(
                                            filterTimeRanges[index + 3],
                                            style: GoogleFonts.notoSans(
                                              fontSize: 14,
                                              color: index + 3 == state
                                                  ? const Color(0xFF0CABDF)
                                                  : const Color(0xFF75808A),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      spaceForheight20,
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: 110,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              'Amount',
                              style: GoogleFonts.notoSans(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: List.generate(
                                2,
                                (index) => Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  height: 52,
                                  width: 170,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE9EEF0),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        amountMinAndMax[index],
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFF787F89),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20,
                                        child: TextFormField(
                                          initialValue: '0',
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                            focusedBorder: InputBorder.none,
                                            enabledBorder: InputBorder.none,
                                            errorBorder: InputBorder.none,
                                            disabledBorder: InputBorder.none,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
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

class FilterStatus extends StatelessWidget {
  const FilterStatus({
    super.key,
    required this.state,
  });
  final int state;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Statuses · 6',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: List.generate(
              3,
              (index) => InkWell(
                onTap: () {
                  BlocProvider.of<StatusFilter>(context).onTap(index);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: index == state
                          ? const Color.fromARGB(255, 208, 236, 245)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text(
                      filterStatuses[index],
                      style: GoogleFonts.notoSans(
                          fontSize: 14,
                          color: index == state
                              ? const Color(0xFF0CABDF)
                              : const Color(0xFF75808A)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Row(
            children: List.generate(
              3,
              (index) => InkWell(
                onTap: () {
                  BlocProvider.of<StatusFilter>(context).onTap(index + 3);
                },
                child: Container(
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                      color: index + 3 == state
                          ? const Color.fromARGB(255, 208, 236, 245)
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    child: Text(
                      filterStatuses[index + 3],
                      style: GoogleFonts.notoSans(
                        fontSize: 14,
                        color: index + 3 == state
                            ? const Color(0xFF0CABDF)
                            : const Color(0xFF75808A),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FilterMoney extends StatelessWidget {
  const FilterMoney({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 85,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            'Money in and out · 2',
            style: GoogleFonts.notoSans(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          BlocBuilder<MoneyFilter, int>(
            builder: (context, state) {
              return Row(
                children: List.generate(
                  2,
                  (index) => InkWell(
                    onTap: () {
                      BlocProvider.of<MoneyFilter>(context).onTap(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          color: index == state
                              ? const Color.fromARGB(255, 208, 236, 245)
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 4),
                        child: Text(
                          filterMoneyInAndOutOptions[index],
                          style: GoogleFonts.notoSans(
                              fontSize: 14,
                              color: index == state
                                  ? const Color(0xFF0CABDF)
                                  : const Color(0xFF75808A)),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.text,
    required this.onTap,
  });
  final String text;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: text == 'Cancel'
              ? const Color(0xFFC6EBF6)
              : const Color(0xFF0CABDF),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: GoogleFonts.notoSans(
                color:
                    text == 'Cancel' ? const Color(0xFF0CABDF) : Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
