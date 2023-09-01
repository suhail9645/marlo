import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marlo/presentation/const/list.dart';
import 'package:marlo/presentation/const/widget.dart';

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
              Padding(
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
                              backgroundImage:
                                  NetworkImage(currenyFlags[index]),
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
              ),
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
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    3,
                    (index) => Container(
                      margin: const EdgeInsets.only(right: 10),
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      height: screenWidth * 0.28,
                      width: screenWidth * 0.40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            colors: toDoBoxGradients[index],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomCenter),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: CircleAvatar(
                              backgroundColor: toDoBoxGradients[index][1],
                              radius: 25,
                              child: Icon(
                                toDoIcons[index],
                                color: toDoIconsColors[index],
                              ),
                            ),
                          ),
                          spaceForheight10,
                          Expanded(
                            flex: 1,
                            child: Center(
                              child: Text(
                                toDoTexts[index],
                                textAlign: TextAlign.center,
                                style: GoogleFonts.notoSans(fontSize: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
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
                  Text(
                    'See all',
                    style:
                        GoogleFonts.notoSans(fontSize: 13, color: Colors.blue),
                  ),
                  spaceForWidth10,
                ],
              ),
              spaceForheight20,
              Column(
                children: List.generate(
                  4,
                  (index) => Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
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
