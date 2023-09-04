import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/list.dart';

class AmoutFilter extends StatelessWidget {
  const AmoutFilter({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
                padding:const EdgeInsets.symmetric(horizontal: 8),
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
    );
  }
}
