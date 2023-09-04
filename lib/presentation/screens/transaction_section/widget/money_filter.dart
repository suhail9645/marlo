import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../logic/filter/filter_cubit.dart';
import '../../../const/list.dart';

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
