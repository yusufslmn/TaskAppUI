import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/project_details/project_color.dart';
import 'package:task_app/screen/extension.dart';

class MyTaskContainer extends StatelessWidget {
  const MyTaskContainer({super.key, required this.title, required this.taskNum});
  final String title;
  final int taskNum;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: context.dynamicWidth(165),
      height: context.dynamicHeight(96),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color.fromRGBO(87, 124, 255, 0.71),
        image: DecorationImage(
          alignment: Alignment.topRight,
          image: AssetImage("assets/images/1.png"),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.workSans(
              color: Colors.white,
              fontSize: 24,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            "$taskNum Projects",
            style: GoogleFonts.workSans(
              color: Colors.white,
              fontSize: 10,
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
