import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inspire/event_provider/event_provider.dart';
import 'package:inspire/model/note_model.dart';
import 'package:inspire/requests/calendar/calendar.dart';
import 'package:inspire/requests/calendar/calendar_screen_request.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class AllCalendarScreen extends StatefulWidget {
  const AllCalendarScreen({Key? key}) : super(key: key);

  @override
  State<AllCalendarScreen> createState() => _AllCalendarScreenState();
}

class _AllCalendarScreenState extends State<AllCalendarScreen> {
  GetStorage calendar = GetStorage();

  var today = DateTime.now();
  List<dynamic> calendar_data = [];

  // void call() {
  //   List<dynamic> calendar_data = calendar.read('calendar');
  //   print(calendar_data.toList());
  // }
  //
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   call();
  // }

  // late DateTime selectedDay;
  // late List<CleanCalendarEvent> selectedEvent;
  // final Map<DateTime, List<Clean>>

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        // centerTitle: true,
        titleSpacing: MediaQuery.of(context).size.width / 5.5,
        // title: Row(
        //   children: [
        //     TextButton(onPressed: () {}, child: Text('Месяц')),
        //     TextButton(onPressed: () {}, child: Text('Год')),
        //   ],
        // ),
        // actions: [
        //   TextButton(onPressed: () {}, child: Text('Сегодня')),
        // ],
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24),
          child: FutureBuilder(
            future: calendarScreenRequest(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data != null) {
                return SafeArea(
                  child: Container(
                      child: SfCalendar(
                    firstDayOfWeek: 1,
                    view: CalendarView.month,
                    initialSelectedDate: DateTime.now(),
                    cellBorderColor: Colors.transparent,
                    // dataSource: MeetingDataSource(_getDataSource()),

                    monthViewSettings: MonthViewSettings(
                      showAgenda: true,
                      navigationDirection: MonthNavigationDirection.vertical,
                      appointmentDisplayMode:
                          MonthAppointmentDisplayMode.appointment,
                    ),
                    dataSource: MeetingDataSource(snapshot.data),
                  )),
                );
              } else {
                return Container(
                  child: Text('error'),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<noteModel> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    DateTime datas = DateTime.parse(appointments![index].created_at);
    print('Дата: ${datas}');
    return datas;
  }

  @override
  DateTime getEndTime(int index) {
    DateTime datas = DateTime.parse(appointments![index].created_at);
    print('Дата: ${datas}');
    return datas;
  }

  @override
  String getSubject(int index) {
    return appointments![index].emoji;
  }

  @override
  Color getColor(int index) {
    return Colors.grey;
  }

  @override
  bool isAllDay(int index) {
    return true;
  }
}
