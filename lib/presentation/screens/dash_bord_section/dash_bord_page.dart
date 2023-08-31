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
        child: Column(
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
                                  fontSize: 14, fontWeight: FontWeight.w500,color:const Color(0xFF75808A)),
                            )
                          ],
                        ),
                      ),
                    ),
                  )),
            )
          ],
        ),
      ),
    ));
  }
}
