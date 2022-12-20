import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/calendar/calendar.dart';
import 'package:InspireApp/screens/calendar/add_mood/add_mood_screen.dart';
import 'package:InspireApp/screens/calendar/all_calendars_screen/all_calendars_screen.dart';
import 'package:InspireApp/screens/calendar/single_note/single_note_screen.dart';
import 'package:InspireApp/screens/meditation_screen/player/player_screen.dart';
import 'package:skeletons/skeletons.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 9),
      child: Scaffold(
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          titleSpacing: 0,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leadingWidth: 0,
          title: Text(
            'Календарь настроения',
            style: GoogleFonts.poppins(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.black,
              height: 1.645,
            ),
          ),
          actions: [
            GestureDetector(
              onTap: () => Get.to(
                () => AllCalendarScreen(),
                transition: Transition.rightToLeft,
              ),
              child: Container(
                width: 45,
                decoration: BoxDecoration(
                  color: Color(0xff21cac8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Image.asset(
                    Const.icns + 'calendar.png',
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        body: GestureDetector(
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(
                        () => AddMoodScreen(),
                        transition: Transition.rightToLeft,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Color(0xffe3f8ff),
                          borderRadius: BorderRadius.circular(15)),
                      margin: EdgeInsets.only(
                        top: 25,
                      ),
                      child: Container(
                        margin: EdgeInsets.all(19),
                        child: Row(
                          children: [
                            Flexible(
                              child: Text(
                                'Напишите, какое у вас настроение сегодня',
                                maxLines: 3,
                                textAlign: TextAlign.start,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Color(0xff4f4f4f),
                                  height: 1.3,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 33,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff21cac8),
                                  borderRadius: BorderRadius.circular(8)),
                              child: Container(
                                  margin: EdgeInsets.all(10.5),
                                  child: SvgPicture.asset(
                                    Const.icns + 'plus.svg',
                                    width: 24,
                                    height: 24,
                                  )),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.symmetric(vertical: 26),
                      child: Divider(
                        color: Color(0xffededed),
                      )),
                  FutureBuilder(
                    future: calendarNotesRequest(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      switch (snapshot.connectionState) {
                        case ConnectionState.none:
                          return Container(
                            padding: EdgeInsets.only(top: 10),
                            child: SkeletonLine(
                              style: SkeletonLineStyle(
                                  height: 70,
                                  width: double.infinity,
                                  borderRadius: BorderRadius.circular(8)),
                            ),
                          );
                        case ConnectionState.waiting:
                          return Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 70,
                                      width: double.infinity,
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 10),
                                child: SkeletonLine(
                                  style: SkeletonLineStyle(
                                      height: 70,
                                      width: double.infinity,
                                      borderRadius: BorderRadius.circular(8)),
                                ),
                              ),
                            ],
                          );

                        default:
                          // return rideList(snapshot.data, context);
                          if (snapshot.data == null) {
                            return Center(
                              child: Container(                                width: 320,

                                margin: EdgeInsets.only(top: 20),
                                padding: EdgeInsets.only(
                                    left: 19,
                                    right: 19,
                                    top: 13.5,
                                    bottom: 10.5),
                                decoration: BoxDecoration(
                                  color: Color(0xffFFFEE3),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: ListTile(
                                  leading: Image.asset(
                                    Const.icns + '!.png',
                                    height: 37,
                                    color: Color(0xffFFDD65),
                                  ),
                                  title: Text(
                                    'Извините, здесь пока ничего нет',
                                    maxLines: 4,
                                    style: TextStyle(
                                        fontSize: 14, color: Const.deepgrey),
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return noteWidget(snapshot.data, context);
                          }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget noteWidget(List items, context) {
    return Column(
      children: items.map<Widget>(
        (note) {
          String date = note.created_at.substring(0, 10).replaceAll(('-'), '.');
          String d = note.created_at.substring(0, 10).substring(8, 10);
          String m = note.created_at.substring(0, 10).substring(5, 7);
          String y = note.created_at.substring(0, 10).substring(0, 4);
          return GestureDetector(
            onTap: () {
              // print('${d}' + '.' + '${m}' + '.' + '${y}');
              Get.to(() => SingleNoteScreen(),
                  transition: Transition.rightToLeft,
                  arguments: [
                    note.title,
                    note.description,
                    note.emoji,
                    note.created_at.substring(0, 10),
                    note.profile_photo_url,
                    note.created_at.substring(11, 16)
                  ]);
            },
            child: Container(
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                  color: Color(0xffF7FAFB),
                  borderRadius: BorderRadius.circular(15)),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xffF7FAFB),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    isThreeLine: true,
                    title: Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        note.title,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Color(0xff4f4f4f),
                              height: 1.3),
                        ),
                      ),
                    ),
                    subtitle: Row(
                      children: [
                        Image.asset(
                          Const.icns + 'calendar.png',
                          color: Color(
                            0xff21cac8,
                          ),
                          width: 15,
                          height: 15,
                        ),
                        SizedBox(
                          width: 7,
                        ),
                        Text(
                          '${d}' + '.' + '${m}' + '.' + '${y}',
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Color(0xff21cac8),
                                height: 1.3),
                          ),
                        ),
                      ],
                    ),
                    trailing: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Color(0xffc9d9de))),
                      child: Container(
                          margin: EdgeInsets.all(10.5),
                          child: Text(
                            note.emoji,
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
