import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/core/card_widget.dart';
import 'package:task_app/core/my_task_container.dart';
import 'package:task_app/screen/calendar.dart';
import 'package:task_app/screen/extension.dart';
import 'package:task_app/screen/profile.dart';
import 'package:task_app/screen/project_detail.dart';
import 'package:task_app/screen/tasks_view.dart';
import '../project_details/project_color.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: const bottomNagivationBar(),
        body: PageView(
          children: [
            Profile(),
            TaskViewPage(),
            ProjectDetail(),
            Calendar(),
          ],
        ));
  }
}

// ignore: camel_case_types
class bottomNagivationBar extends StatelessWidget {
  const bottomNagivationBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: context.dynamicHeight(105),
      child: Card(
          color: ProjectColorsUtitilty().backgroundPage,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          elevation: 3,
          margin: EdgeInsets.all(19),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.home_rounded,
                    color: Color.fromARGB(255, 162, 158, 182),
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.profile_circled,
                    color: Color.fromARGB(255, 162, 158, 182),
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.task_alt_rounded,
                    color: Color.fromARGB(255, 162, 158, 182),
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.calendar_today_outlined,
                    size: 22,
                    color: Color.fromARGB(255, 162, 158, 182),
                  )),
            ],
          )),
    );
  }
}
