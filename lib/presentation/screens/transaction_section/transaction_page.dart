import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marlo/logic/filter/filter_cubit.dart';
import 'package:marlo/presentation/const/widget.dart';

import 'widget/bottem_sheet.dart';

class TransactionPage extends StatelessWidget {
  const TransactionPage({super.key});
  @override
  Widget build(BuildContext context) {
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
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (_) => MultiBlocProvider(
                            providers: [
                              BlocProvider.value(
                                value: BlocProvider.of<MoneyFilter>(context),
                              ),
                               BlocProvider.value(
                                value: BlocProvider.of<StatusFilter>(context),
                              )
                            ],
                            child: FilterBottermSheet(),
                          ),
                        );
                      },
                      child: Container(
                        height: 35,
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 229, 238, 241),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Center(
                          child: Icon(Icons.filter_alt_sharp,
                              color: Color(0xFF76808A)),
                        ),
                      ),
                    ),
                  )
                ],
              ),
              spaceForheight20,
              Column(
                children: List.generate(
                  15,
                  (index) => Container(
                    margin:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 0),
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
                                color: index % 2 == 0
                                    ? Colors.green
                                    : Colors.black,
                                fontSize: 15),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
