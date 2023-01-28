import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

class Calendar extends StatefulWidget {
  Calendar({super.key});
  @override
  State<Calendar> createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: DayView(
        backgroundColor: Colors.white,
        controller: EventController(),
        fullDayEventBuilder: (events, date) {
          // Return your widget to display full day event view.
          return Row(
            children: [
              Container(
                alignment: Alignment.center,
                height: 39,
                width: 46,
                color: Color.fromRGBO(255, 176, 87, 1),
                child: Text(
                  days[date.weekday],
                ),
              ),
            ],
          );
        },

        hourIndicatorSettings: HourIndicatorSettings(offset: 0.0),
        showVerticalLine: true, // To display live time line in day view.
        showLiveTimeLineInAllDays: true, // To display live time line in all pages in day view.
        minDay: DateTime(1990),
        maxDay: DateTime(2050),
        initialDay: DateTime(2021),
        heightPerMinute: 1, // height occupied by 1 minute time span.
        eventArranger: SideEventArranger(), // To define how simultaneous events will be arranged.
        onEventTap: (events, date) => print(events),
        onDateLongPress: (date) => print(date),
      ),
    );
  }
}

List<String> days = [
  "Sun",
  "Mon",
  "Tue",
  "Wed",
  "Thu",
  "Fri",
  "Sat",
  "Sun",
];
