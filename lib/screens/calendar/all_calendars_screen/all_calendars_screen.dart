import 'dart:convert';
import 'package:inspire/screens/calendar/single_note/single_note_screen.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:inspire/event_provider/event_provider.dart';
import 'package:inspire/model/note_model.dart';
import 'package:inspire/requests/calendar/calendar.dart';
import 'package:inspire/requests/calendar/calendar_screen_request.dart';
import 'package:inspire/screens/calendar/all_calendars_screen/add_mood_on_calendar_screen/add_mood_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    final events = Provider
        .of<EventProvider>(context)
        .events;

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
        titleSpacing: MediaQuery
            .of(context)
            .size
            .width / 5.5,

        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: FutureBuilder(
                future: calendarScreenRequest(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.data != null) {
                    calendar_data.addAll(snapshot.data,);
                    print('calendar_data ${calendar_data.asMap()['title']}');
                    return SafeArea(
                      // child: TableCalendar(
                      //   firstDay: DateTime.utc(2010, 10, 16),
                      //   lastDay: DateTime.utc(2030, 3, 14),
                      //   focusedDay: DateTime.now(),
                      //   locale: 'ru_RU',
                      //
                      // ),
                      child: Container(
                        child: SfCalendar(

                          firstDayOfWeek: 1,
                          view: CalendarView.month,
                          initialSelectedDate: DateTime.now(),
                          // selectionDecoration: BoxDecoration(),
                          cellBorderColor: Colors.transparent,
                          // dataSource: MeetingDataSource(_getDataSource()),
                          showNavigationArrow: true,
                          // showDatePickerButton: true,
                          allowViewNavigation: true,
                          showCurrentTimeIndicator: true,
                          scheduleViewSettings: ScheduleViewSettings(),
                          todayHighlightColor: Color(0xFF21cac8),
                          monthViewSettings: MonthViewSettings(
                            agendaViewHeight: 400,
                            agendaItemHeight: 30,
                            appointmentDisplayCount: 2,
                            dayFormat: 'EEE',
                            showAgenda: true,
                            navigationDirection:
                            MonthNavigationDirection.vertical,
                            appointmentDisplayMode:
                            MonthAppointmentDisplayMode.appointment,
                          ),
                          dataSource: MeetingDataSource(snapshot.data),
                          onTap: calendarTapped,
                        ),
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Color(0xff21cac8),
                      ),
                    );
                  }
                },
              ),
            ),
            Positioned(
              bottom: 100,
              right: 10,
              child: FloatingActionButton.small(
                backgroundColor: Color(0xff21cac8),
                onPressed: () =>
                    Get.to(
                      (AddMoodScreenOnCalendarScreen()),
                    ),
                child: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void calendarTapped(CalendarTapDetails details,) {
    // print(calendar_data[0]);
    // Get.to(()=>SingleNoteScreen(),  transition: Transition.rightToLeft,
    //     arguments: [
    //       // calendar_data.title,
    //       // calendar_data.description,
    //       // calendar_data.emoji,
    //       // calendar_data.created_at.substring(0, 10),
    //       // calendar_data.profile_photo_url,
    //       // calendar_data.created_at.substring(11, 16)
    //     ]);
  }

}


class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<noteModel> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    DateTime datas = DateTime.parse(appointments![index].created_at);
    // print('Дата: ${datas}');
    return datas;
  }

  @override
  DateTime getEndTime(int index) {
    DateTime datas = DateTime.parse(appointments![index].created_at);
    // print('Дата: ${datas}');
    return datas;
  }

  @override
  String getSubject(int index) {
    return appointments![index].emoji;
  }

  @override
  Color getColor(int index) {
    return Color(0xffececec);
  }

  @override
  bool isAllDay(int index) {
    return true;
  }
}

