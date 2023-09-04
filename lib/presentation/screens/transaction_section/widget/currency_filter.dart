import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../logic/filter/filter_cubit.dart';
import '../../../const/list.dart';

class CurrencyContainer extends StatelessWidget {
  const CurrencyContainer({
    super.key, required this.state, required this.ctx,
  });
 final CurrensyStateList state;
 final BuildContext ctx;
  @override
  Widget build(BuildContext context) {
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
                            ctx)
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
  }
}

