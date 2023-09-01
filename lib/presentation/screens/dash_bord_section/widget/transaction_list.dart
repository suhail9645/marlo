
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/widget.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(
        4,
        (index) => Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
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
              'Rent',
              style: GoogleFonts.notoSans(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'Sat ·16 Jul · 9.00 pm',
              style: GoogleFonts.notoSans(
                  fontSize: 13, color: const Color(0xFF979797)),
            ),
            trailing: Column(
              children: [
                spaceForheight10,
                Text(
                  '-\$850.00',
                  style: GoogleFonts.notoSans(
                      color: index % 2 == 0 ? Colors.green : Colors.black,
                      fontSize: 15),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
