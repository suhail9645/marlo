import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marlo/data_layer/model/transactions/datum.dart';

import '../../../const/widget.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({
    super.key,
    required this.allTransactions,
  });
  final List<Transaction> allTransactions;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(4, (index) {
        String minusOrPlus =
            allTransactions[index].amount![0] == '-' ? '-' : '+';
        String currency = allTransactions[index].currency!;
        String amount = allTransactions[index].amount!;
        if (amount[0] == '-') {
          amount = amount.substring(1, amount.length);
        }
        String realAmount = minusOrPlus + currency + amount.toString();
        return Container(
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
              allTransactions[index].description!,
              style: GoogleFonts.notoSans(
                  fontSize: 16, fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              allTransactions[index].createdAt!.toString(),
              style: GoogleFonts.notoSans(
                  fontSize: 13, color: const Color(0xFF979797)),
            ),
            trailing: Column(
              children: [
                spaceForheight10,
                Text(
                  realAmount,
                  style: GoogleFonts.notoSans(
                      color: allTransactions[index].amount![0]!='-' ? Colors.green : Colors.black,
                      fontSize: 15),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
