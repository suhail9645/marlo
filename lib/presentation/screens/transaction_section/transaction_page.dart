import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marlo/data_layer/model/transactions/datum.dart';
import 'package:marlo/logic/filter/filter_cubit.dart';
import 'package:marlo/logic/filter_bloc/filter_bloc.dart';
import 'package:marlo/presentation/const/widget.dart';
import '../../../logic/search_cubit/search_cubit.dart';
import '../../../logic/transaction/transactions_bloc.dart';
import 'widget/bottem_sheet.dart';

class TransactionPage extends StatelessWidget {
  TransactionPage({super.key, required this.allTransactions});
  final TextEditingController searchController = TextEditingController();
  final List<Transaction> allTransactions;

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<SearchCubit>(context).onSearch('', allTransactions);
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: const Icon(
                      Icons.arrow_back_ios_sharp,
                      size: 27,
                    ),
                  ),
                  const Spacer(),
                  const Icon(
                    Icons.download,
                    size: 27,
                  ),
                  spaceForWidth10
                ],
              ),
              spaceForheight20,
              Text(
                'Transactions',
                style: GoogleFonts.heebo(
                    fontSize: 34, fontWeight: FontWeight.bold),
              ),
              spaceForheight20,
              Row(
                children: [
                  Expanded(
                    flex: 9,
                    child: Container(
                      margin: const EdgeInsets.only(right: 10),
                      height: 35,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 229, 238, 241),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        controller: searchController,
                        onChanged: (value) {
                          BlocProvider.of<SearchCubit>(context)
                              .onSearch(value, allTransactions);
                        },
                        decoration: InputDecoration(
                          hintText: 'Search vessel',
                          hintStyle: GoogleFonts.notoSans(
                              fontSize: 16, color: const Color(0xFFBBC9CD)),
                          contentPadding: const EdgeInsets.all(10),
                          border: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          errorBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          suffixIcon: const Icon(
                            CupertinoIcons.search,
                            color: Color(0xFF76808A),
                          ),
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<FilterBloc, FilterState>(
                    builder: (context, state) {
                      if (state is FilterImplemntState) {
                        BlocProvider.of<SearchCubit>(context)
                            .onFilter(state, allTransactions);
                      }
                      return Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            showModalBottomSheet(
                              isScrollControlled: true,
                              context: context,
                              builder: (_) => MultiBlocProvider(
                                providers: [
                                  BlocProvider.value(
                                    value:
                                        BlocProvider.of<MoneyFilter>(context),
                                  ),
                                  BlocProvider.value(
                                    value:
                                        BlocProvider.of<StatusFilter>(context),
                                  ),
                                  BlocProvider.value(
                                    value: BlocProvider.of<DateFilter>(context),
                                  ),
                                  BlocProvider.value(
                                    value: BlocProvider.of<CurrencyFilter>(
                                        context),
                                  ),
                                  BlocProvider.value(
                                    value: BlocProvider.of<FilterBloc>(context),
                                  ),
                                  BlocProvider.value(
                                    value:
                                        BlocProvider.of<SearchCubit>(context),
                                  )
                                ],
                                child: FilterBottermSheet(
                                  allTransactions: allTransactions,
                                ),
                              ),
                            );
                          },
                          child: Container(
                            height: 35,
                            decoration: BoxDecoration(
                              color: state is! FilterImplemntState
                                  ? const Color.fromARGB(255, 229, 238, 241)
                                  : const Color.fromARGB(255, 208, 236, 245),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Icon(Icons.filter_alt_sharp,
                                  color: state is! FilterImplemntState
                                      ? const Color(0xFF76808A)
                                      : const Color(0xFF0CABDF)),
                            ),
                          ),
                        ),
                      );
                    },
                  )
                ],
              ),
              spaceForheight10,
              BlocBuilder<FilterBloc, FilterState>(
                builder: (context, state) {
                  if (state is FilterImplemntState) {
                    List<List<String>> itemsToshow = state.itemsToshow();

                    return GridView.builder(
                      shrinkWrap: true,
                      itemCount: itemsToshow.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              mainAxisExtent: 25,
                              mainAxisSpacing: 5,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            BlocProvider.of<FilterBloc>(context).add(
                                FilterEditEvent(
                                    value: itemsToshow[index].first,
                                    state: state));
                            BlocProvider.of<SearchCubit>(context)
                                .onFilter(state, allTransactions);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 208, 236, 245),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  itemsToshow[index][1],
                                  style: GoogleFonts.notoSans(
                                      fontSize: 14,
                                      color: const Color(0xFF0CABDF)),
                                ),
                                const Icon(
                                  Icons.close,
                                  color: Color(0xFF0CABDF),
                                  size: 20,
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const SizedBox();
                  }
                },
              ),
              spaceForheight10,
              BlocBuilder<SearchCubit, SearchState>(
                builder: (context, state) {
                  if (state is SearchResult) {
                    return state.searchResult.isNotEmpty
                        ? ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.searchResult.length,
                            itemBuilder: (context, index) {
                              String minusOrPlus =
                                  state.searchResult[index].amount![0] == '-'
                                      ? '-'
                                      : '+';
                              String currency =
                                  state.searchResult[index].currency!;
                              String amount = state.searchResult[index].amount!;
                              if (amount[0] == '-') {
                                amount = amount.substring(1, amount.length);
                              }
                              String realAmount =
                                  minusOrPlus + currency + amount.toString();

                              return Container(
                                margin: const EdgeInsets.symmetric(
                                    vertical: 5, horizontal: 0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ListTile(
                                  leading: Container(
                                    height: 45,
                                    width: 45,
                                    decoration: BoxDecoration(
                                      color: const Color(0xFF00455B),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: index % 2 == 0
                                          ? const Icon(
                                              Icons.attach_money,
                                              color: Colors.white,
                                              size: 30,
                                            )
                                          : const Icon(
                                              Icons.arrow_outward,
                                              color: Colors.white,
                                              size: 30,
                                            ),
                                    ),
                                  ),
                                  title: Text(
                                    state.searchResult[index].description!,
                                    style: GoogleFonts.notoSans(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    'Sat ·16 Jul · 9.00 pm',
                                    style: GoogleFonts.notoSans(
                                        fontSize: 13,
                                        color: const Color(0xFF979797)),
                                  ),
                                  trailing: Column(
                                    children: [
                                      spaceForheight10,
                                      Text(
                                        realAmount,
                                        style: GoogleFonts.notoSans(
                                            color: state.searchResult[index]
                                                        .amount![0] ==
                                                    '-'
                                                ? Colors.black
                                                : Colors.green,
                                            fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          )
                        : const Center(
                            child: Text('No Items to Show'),
                          );
                  } else {
                    return const SizedBox();
                  }
                },
              )
            ],
          ),
        ),
      ),
    ));
  }
}
