import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marlo/presentation/const/list.dart';
import 'package:marlo/presentation/const/widget.dart';

import 'widget/currency_row.dart';
import 'widget/to_do_row.dart';
import 'widget/transaction_list.dart';

class DashBordPage extends StatelessWidget {
  const DashBordPage({super.key});
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double screeHeight = screenSize.height;
    double screenWidth = screenSize.width;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 35,
                      width: 35,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFF9F0A),
                          border: Border.all(
                            color: const Color(0xFFDB8500),
                          ),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: Text(
                          'JB',
                          style: GoogleFonts.varelaRound(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.notifications,
                      color: Colors.blue,
                      size: 26,
                    ),
                    spaceForWidth10
                  ],
                ),
                spaceForheight20,
                const CurrenyRow(),
                spaceForheight20,
                spaceForheight10,
                Text(
                  'To Do . 4',
                  style: GoogleFonts.notoSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF768089),
                  ),
                ),
                spaceForheight20,
                ToDoRow(screenWidth: screenWidth),
                spaceForheight20,
                Row(
                  children: [
                    Text(
                      'All transactions',
                      style: GoogleFonts.notoSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: const Color(0xFF768089),
                      ),
                    ),
                    const Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, 'Transaction');
                      },
                      child: Text(
                        'See all',
                        style: GoogleFonts.notoSans(
                            fontSize: 13, color: Colors.blue),
                      ),
                    ),
                    spaceForWidth10,
                  ],
                ),
                spaceForheight20,
                const TransactionList()
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          iconSize: 30,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.blue,
          items: List.generate(
            5,
            (index) => BottomNavigationBarItem(
                icon: Image.asset(
                  bottemImage[index],
                  height: 25,
                  width: 25,
                ),
                label: bottemTexts[index]),
          )),
    );
  }
}
