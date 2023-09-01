import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marlo/logic/filter/filter_cubit.dart';
import 'package:marlo/presentation/const/list.dart';
import 'package:marlo/presentation/const/widget.dart';

class FilterBottermSheet extends StatelessWidget {
  const FilterBottermSheet({
    super.key,
  });

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
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
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
                    Text(
                      'Clear',
                      style: GoogleFonts.notoSans(
                          fontSize: 15,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              ],
            ),
            spaceForheight10,
            Container(
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
                              BlocProvider.of<MoneyFilter>(context)
                                  .onTap(index);
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
            ),
            spaceForheight20,
            BlocBuilder<StatusFilter, int>(
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
                              BlocProvider.of<StatusFilter>(context)
                                  .onTap(index);
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
                              BlocProvider.of<StatusFilter>(context)
                                  .onTap(index + 3);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                  color: index + 3 == state
                                      ? const Color.fromARGB(255, 208, 236, 245)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 4),
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
              },
            )
          ],
        ),
      ),
    );
  }
}
