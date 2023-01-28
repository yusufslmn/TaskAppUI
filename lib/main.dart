import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:task_app/screen/calendar.dart';
import 'package:task_app/screen/project_detail.dart';
import 'package:task_app/screen/task_home_screen.dart';
import 'package:task_app/screen/tasks_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return CalendarControllerProvider(
      controller: EventController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
