import 'dart:collection';
import 'dart:convert';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/requests/calendar/single_note.dart';
import 'package:InspireApp/screens/calendar/single_note/single_note_screen.dart';
import 'package:InspireApp/screens/calendar/single_note/single_note_screen_fb.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:InspireApp/event_provider/event_provider.dart';
import 'package:InspireApp/model/note_model.dart';
import 'package:InspireApp/requests/calendar/calendar.dart';
import 'package:InspireApp/requests/calendar/calendar_screen_request.dart';
import 'package:InspireApp/screens/calendar/all_calendars_screen/add_mood_on_calendar_screen/add_mood_screen.dart';
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
  late CalendarController _calendarController;
  var today = DateTime.now();
  var selectedDay = DateTime.now();
  var focusedDay = DateTime.now();
  List<dynamic> calendar_data = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _calendarController = CalendarController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _calendarController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final events = Provider.of<EventProvider>(context).events;

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            // calendar_data;
            Get.back();
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        // centerTitle: true,
        titleSpacing: MediaQuery.of(context).size.width / 5.5,

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
                    calendar_data.addAll(
                      snapshot.data,
                    );

                    return SafeArea(
                      // child: TableCalendar(
                      //   firstDay: DateTime.utc(2010, 10, 16),
                      //   lastDay: DateTime.utc(2030, 3, 14),
                      //   focusedDay: focusedDay,
                      //   onDaySelected: (DateTime selectDay, DateTime focusDay){
                      //     setState(() {
                      //       selectedDay = selectDay;
                      //       focusedDay = focusDay;
                      //     });
                      //   },
                      //   locale: 'ru_RU',
                      //   startingDayOfWeek: StartingDayOfWeek.monday,
                      //   selectedDayPredicate: (DateTime date){
                      //     return isSameDay(selectedDay, date);
                      //   },
                      //   headerStyle: HeaderStyle(
                      //     formatButtonVisible: false,
                      //     titleCentered: true,
                      //   ),
                      //   // eventLoader: _getEventsForDay,
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
                          appointmentTextStyle: GoogleFonts.poppins(
                            fontSize: 24,
                          ),
                          // scheduleViewSettings: ScheduleViewSettings(appointmentTextStyle: GoogleFonts.poppins(fontSize: 24)),
                          todayHighlightColor: Color(0xFF21cac8),

                          monthViewSettings: MonthViewSettings(
                            agendaStyle: AgendaStyle(
                              appointmentTextStyle:
                                  GoogleFonts.poppins(fontSize: 24),
                            ),
                            agendaViewHeight: 300,
                            agendaItemHeight: 24,
                            appointmentDisplayCount: 1,
                            dayFormat: 'EEE',
                            showAgenda: true,
                            navigationDirection:
                                MonthNavigationDirection.vertical,
                            appointmentDisplayMode:
                                MonthAppointmentDisplayMode.appointment,
                          ),
                          dataSource: MeetingDataSource(snapshot.data),
                          onTap: calendarTapped,
                          onLongPress: calendarLongPressTapped,
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
            // Positioned(
            //   bottom: 100,
            //   right: 10,
            //   child: FloatingActionButton.small(
            //     backgroundColor: Color(0xff21cac8),
            //     onPressed: () => Get.to(
            //       (AddMoodScreenOnCalendarScreen()),
            //     ),
            //     child: Icon(Icons.add),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  void calendarTapped(CalendarTapDetails details) {
    // print(details.date);
    // singleNoteRequest(details.date.toString().substring(0, 10));

    print(details.appointments?.length.toString());



    if(details.appointments?.length != 0) {
      print('не пусто');
      Get.to(
            () => SingleNoteScreenFB(),
        transition: Transition.downToUp,
        arguments: [
          details.date.toString().substring(0, 10),
        ],
      );
    } else {
      print('пусто');

    }
  }

  void calendarLongPressTapped(
      // CalendarTapDetails details,
      CalendarLongPressDetails details) {
    // print(details.targetElement);
    // print(calendar_data[0]);
    // print(details.resource);

    // Get.to(() => SingleNoteScreen(),
    //     transition: Transition.rightToLeft,
    //     arguments: [
    //       calendar_data[0].title,
    //       calendar_data[0].description,
    //       calendar_data[0].emoji,
    //       calendar_data[0].created_at.substring(0, 10),
    //       calendar_data[0].profile_photo_url,
    //       calendar_data[0].created_at.substring(11, 16)
    //     ]);

    showData(int index) {
      // DateTime datas = DateTime.parse(details.appointments![index].created_at);
      // print('Дата: ${datas}');
    }

    Map mapping = calendar_data.asMap();

    // print(mapping.keys);
    // print(mapping.values);

    // print('asd');

    // Get.to(() => SingleNoteScreen(),
    //     transition: Transition.rightToLeft,
    //     arguments: [
    //       //   i.title,
    //       // i.description,
    //       // i.emoji,
    //       // i.created_at.substring(0, 10),
    //       // i.profile_photo_url,
    //       // i.created_at.substring(11, 16)
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
    // return Color(0xffececec);
    return Colors.transparent;
  }

  @override
  bool isAllDay(int index) {
    return true;
  }
}

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}
