import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/core/card_widget.dart';
import 'package:task_app/core/my_task_container.dart';
import 'package:task_app/screen/extension.dart';
import 'package:task_app/screen/tasks_view.dart';
import '../project_details/project_color.dart';

class Profile extends StatefulWidget {
  Profile({super.key});
  final String userName = "Dan Smith";
  final String listTitle = "My Task";
  final String listTitle2 = "Son Projeler ";
  final String listTextButton = "Hepsini Gör";
  final List<String> MyTaskString = [
    "In Process",
    "Running",
    "Complete",
    "Cancel",
  ];
  final List<String> MyTask = [
    "UI/UX Tasarımı",
    "Kripto Cüzdan Uygulaması",
    "2 Ekranın Geliştirilmesi",
    "Kripto Cüzdan Uygulaması",
  ];
  final String date = "Mon, 10 July 2022";

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle().copyWith(
            statusBarColor: Colors.white,
            statusBarBrightness: Brightness.dark,
          ),
          backgroundColor: ProjectColorsUtitilty().backgroundPage,
          elevation: 0.0,
          leading: LeadingWidget(),
          title: appBarTitle(),
          actions: [
            AppBarIconSearch(),
            AppBarIconNotification(),
          ],
        ),
        body: PageView(
          children: [
            Padding(
              padding: const EdgeInsets.all(21.0),
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Text(
                            widget.listTitle,
                            style: GoogleFonts.workSans(
                              color: ProjectColorsUtitilty().appBarText2,
                              fontSize: 24,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                CupertinoIcons.add,
                                color: Colors.black,
                              )),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            MyTaskContainer(title: widget.MyTaskString[0], taskNum: 10),
                            MyTaskContainer(title: widget.MyTaskString[1], taskNum: 10),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 17.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MyTaskContainer(title: widget.MyTaskString[2], taskNum: 10),
                              MyTaskContainer(title: widget.MyTaskString[3], taskNum: 10),
                            ],
                          ),
                        ),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Text(
                            widget.listTitle2,
                            style: GoogleFonts.workSans(
                              color: ProjectColorsUtitilty().appBarText2,
                              fontSize: 18,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          trailing: TextButton(
                              onPressed: () {},
                              child: Text(
                                widget.listTextButton,
                                style: GoogleFonts.workSans(
                                  color: ProjectColorsUtitilty().appBarText1,
                                  fontSize: 12,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.w400,
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      itemBuilder: (context, index) {
                        return CardWidget(taskTitle: widget.MyTask[index], taskSubtitle: widget.MyTask[index + 1], date: widget.date);
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ));
  }

  Text appBarTitle() {
    return Text(
      widget.userName,
      style: GoogleFonts.workSans(
        color: ProjectColorsUtitilty().appBarText2,
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // ignore: non_constant_identifier_names
  IconButton AppBarIconSearch() {
    return IconButton(
        onPressed: () {},
        icon: const Icon(
          CupertinoIcons.search,
          color: Colors.black,
          size: 25,
        ));
  }

  IconButton AppBarIconNotification() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        CupertinoIcons.bell,
        color: Colors.black,
      ),
    );
  }

  Padding LeadingWidget() {
    return Padding(
      padding: const EdgeInsets.only(
        left: 14.0,
      ),
      child: Container(
        width: context.dynamicWidth(45),
        height: context.dynamicHeight(45),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage("assets/images/avatar.png")),
        ),
      ),
    );
  }
}
