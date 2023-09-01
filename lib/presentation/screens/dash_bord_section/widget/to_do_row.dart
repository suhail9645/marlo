
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../const/list.dart';
import '../../../const/widget.dart';

class ToDoRow extends StatelessWidget {
  const ToDoRow({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
    );
  }
}
