import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/list.dart';
import '../../../const/widget.dart';

class CurrenyRow extends StatelessWidget {
  const CurrenyRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            3,
            (index) => Container(
              height: 150,
              width: 150,
              margin: const EdgeInsets.only(left: 10),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundImage: NetworkImage(currenyFlags[index]),
                  ),
                  spaceForheight10,
                  Text(
                    currencyValues[index],
                    style: GoogleFonts.heebo(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    currencyNames[index],
                    style: GoogleFonts.notoSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF75808A)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
