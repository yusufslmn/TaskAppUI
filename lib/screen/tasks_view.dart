import 'package:dots_indicator/dots_indicator.dart';
import 'package:fluentui_icons/fluentui_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_app/core/card_widget.dart';
import 'package:task_app/project_details/project_color.dart';
import 'package:task_app/screen/extension.dart';

class TaskViewPage extends StatefulWidget {
  TaskViewPage({super.key});
  final String dateTime = "İyi Akşamlar!";
  final String userName = "Rümeysa";
  final String weekTask = "Haftalık Görevlerim";
  final String dayTask = "Bugünün Görevleri";
  final int weekTaskTotal = 6;
  final int dayTaskTotal = 3;
  final String tasktitle = "UI/UX Design";
  final String taskImportantLevel = "Öncelikli";
  final String taskdetail = "Giriş Sayfasının Oluşturulması";
  final String date = "Salı, 24 Aralık 2022";
  final int teamTotal = 3;
  final String dayTaskTitle = "Mobil Uygulama UI Tasarımı";
  final String dayTaskSubtitle = "Kripto Cüzdan Uygulaması";
  final ScrollController _scrollController = ScrollController();

  @override
  State<TaskViewPage> createState() => _TaskViewPageState();
}

class _TaskViewPageState extends State<TaskViewPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ProjectColorsUtitilty().backgroundPage,
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 8.0, bottom: 8),
        child: Column(
          children: [
            Expanded(flex: 1, child: ListTileWidget(taskType: widget.weekTask, taskTotal: widget.weekTaskTotal)),
            Expanded(
              flex: 3,
              child: ListView.builder(
                controller: widget._scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.only(right: 15),
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), color: ProjectColorsUtitilty().containerColor),
                    width: context.dynamicWidth(203),
                    height: context.dynamicHeight(230),
                    child: Column(
                      children: [
                        Expanded(child: containerTitle()),
                        Expanded(child: containerNote()),
                        Expanded(child: containerTeamAvatars()),
                        Expanded(child: containerDate()),
                      ],
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: DotsIndicator(
                dotsCount: 3,
                position: 0,
                decorator: DotsDecorator(
                  activeColor: Colors.black,
                  size: const Size.square(9.0),
                  activeSize: const Size(18.0, 9.0),
                  activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  spacing: EdgeInsets.all(1),
                ),
              ),
            ),
            Expanded(flex: 1, child: ListTileWidget(taskType: widget.dayTask, taskTotal: widget.dayTaskTotal)),
            Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: 2,
                      itemBuilder: ((context, index) {
                        return CardWidget(
                          date: widget.date,
                          taskSubtitle: widget.dayTaskSubtitle,
                          taskTitle: widget.dayTaskTitle,
                        );
                      })),
                )),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle().copyWith(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ),
      backgroundColor: ProjectColorsUtitilty().backgroundPage,
      elevation: 0.0,
      leading: LeadingWidget(),
      title: AppBarTitle(dateTime: widget.dateTime, userName: widget.userName),
      actions: [
        AppBarIconSearch(),
        AppBarIconNotification(),
      ],
    );
  }

  Row containerDate() {
    return Row(
      children: [
        Icon(Icons.date_range_outlined),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0),
          child: Text(
            maxLines: 1,
            widget.date,
            style: GoogleFonts.workSans(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              fontStyle: FontStyle.normal,
              color: ProjectColorsUtitilty().dateText,
            ),
          ),
        ),
      ],
    );
  }

  Row containerTeamAvatars() {
    return Row(
      children: [
        Stack(
          children: [
            CircleAvatar(),
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: CircleAvatar(
                backgroundColor: Colors.black,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 46.0),
              child: CircleAvatar(
                backgroundColor: ProjectColorsUtitilty().TeamTotal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${widget.teamTotal}+",
                      style: GoogleFonts.workSans(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Color.fromARGB(255, 255, 255, 255),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Text containerNote() {
    return Text(
      widget.taskdetail,
      style: GoogleFonts.workSans(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.normal,
        color: Colors.black,
      ),
    );
  }

  Row containerTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          widget.tasktitle,
          style: GoogleFonts.workSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: ProjectColorsUtitilty().taskTitle,
          ),
        ),
        Text(
          widget.taskImportantLevel,
          style: GoogleFonts.workSans(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            fontStyle: FontStyle.normal,
            color: ProjectColorsUtitilty().taskImportantText,
          ),
        ),
      ],
    );
  }

  // ignore: non_constant_identifier_names
  Padding LeadingWidget() {
    return Padding(
      padding: EdgeInsets.only(
        left: 14.0,
      ),
      child: Container(
        width: context.dynamicWidth(45),
        height: context.dynamicHeight(45),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: AssetImage("assets/images/avatar.png")),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  IconButton AppBarIconNotification() {
    return IconButton(
      onPressed: () {},
      icon: const Icon(
        CupertinoIcons.bell,
        color: Colors.black,
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
                    CupertinoIcons.bolt_horizontal_circle_fill,
                    color: Color.fromARGB(255, 162, 158, 182),
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.bell,
                    color: Color.fromARGB(255, 162, 158, 182),
                  )),
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    CupertinoIcons.settings,
                    color: Color.fromARGB(255, 162, 158, 182),
                  )),
            ],
          )),
    );
  }
}

class ListTileWidget extends StatelessWidget {
  const ListTileWidget({
    Key? key,
    required this.taskType,
    required this.taskTotal,
  }) : super(key: key);

  final String taskType;
  final int taskTotal;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 0, right: 10),
      title: Text(
        taskType,
        style: GoogleFonts.workSans(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.normal,
        ),
      ),
      subtitle: Text(
        "$taskTotal Görev Yapılmayı Bekliyor",
        style: GoogleFonts.workSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          fontStyle: FontStyle.normal,
        ),
      ),
      trailing: SizedBox(
        width: context.dynamicWidth(100),
        height: context.dynamicHeight(37),
        child: Row(
          children: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.tune_rounded,
                  color: Colors.black,
                )),
            VerticalDivider(
              indent: 0.5,
              width: 0,
              color: ProjectColorsUtitilty().buttonSide,
              thickness: 1,
            ),
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.add,
                  color: Colors.black,
                )),
          ],
        ),
      ),
    );
  }
}

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({
    Key? key,
    this.dateTime,
    required this.userName,
  }) : super(key: key);

  final String? dateTime;
  final String userName;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Title1(),
        UserNameText(),
      ],
    );
  }

  Text UserNameText() {
    return Text(
      userName,
      style: GoogleFonts.workSans(
        color: ProjectColorsUtitilty().appBarText2,
        fontSize: 20,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  Text Title1() {
    return Text(
      dateTime!,
      style: GoogleFonts.workSans(
        color: ProjectColorsUtitilty().appBarText1,
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
