import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/project_details/project_color.dart';
import 'package:task_app/screen/extension.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, required this.taskTitle, required this.taskSubtitle, required this.date});

  final String? taskTitle;
  final String? taskSubtitle;
  final String? date;
  final int teamTotal = 1;
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.only(
        bottom: 10,
        left: 1,
        right: 1,
      ),
      elevation: 4,
      color: Colors.white,
      child: Container(
        alignment: Alignment.center,
        height: context.dynamicHeight(152),
        width: context.dynamicWidth(340),
        child: Column(
          children: [
            ListTile(
              shape: RoundedRectangleBorder(),
              title: Text(
                taskTitle!,
                style: GoogleFonts.workSans(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal,
                  color: ProjectColorsUtitilty().appBarText2,
                ),
              ),
              subtitle: Text(
                taskSubtitle!,
                style: GoogleFonts.workSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: Color.fromARGB(255, 123, 123, 123),
                ),
              ),
              trailing: Icon(
                size: 35,
                Icons.check_circle_rounded,
                color: ProjectColorsUtitilty().iconColor,
              ),
            ),
            Divider(color: Color.fromARGB(255, 134, 133, 133), indent: 20, endIndent: 20, thickness: 1),
            ListTile(
              leading: Icon(
                CupertinoIcons.calendar,
                color: Colors.black,
              ),
              title: Text(
                date!,
                style: GoogleFonts.workSans(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  fontStyle: FontStyle.normal,
                  color: Color.fromARGB(255, 123, 123, 123),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
