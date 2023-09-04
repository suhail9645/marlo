
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../logic/filter/filter_cubit.dart';
import '../../../const/list.dart';

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
