import 'dart:convert';

import 'package:anchor_scroll_controller/anchor_scroll_controller.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/app_bar.dart';
import 'package:inspire/constants/bottom_app_bar.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/requests/profile/profile.dart';
import 'package:inspire/screens/calendar/add_mood/add_mood_screen.dart';
import 'add_note.dart';
import 'affirmations.dart';
import 'meditations.dart';
import 'mini_courses.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  GetStorage data_list = GetStorage();
  GetStorage auth = GetStorage();
  GetStorage user = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // profileRequest();
  }

  @override
  Widget build(BuildContext context) {
    var decoded = jsonDecode(data_list.read('data_list'));

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 59),
        child: AppBarWidget(),
      ),
      // bottomNavigationBar: BottomNav(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.only(top: 30),
            color: Color(0xffffffff),
            child: Column(
              children: [

                Container(
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: Row(
                    children: [
                      Text('👋 Привет, ${decoded[0]['user']['name']}',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Const.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 24)))
                    ],
                  ),
                ),
                MoodButton(),
                Meditations(),
                Affirmations(),
                MiniCourses(),
                AddNote(),
                // DoSelfie(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget MoodButton() {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.only(
          top: 12,
          bottom: 43,
          left: 24,
          right: 24,
        ),
        padding: EdgeInsets.only(
          top: 18,
          bottom: 18,
        ),
        decoration: BoxDecoration(
          color: Const.semiturq,
          borderRadius: BorderRadius.circular(15),
        ),
        child: ListTile(
          onTap: () {},
          leading: Text(
            '💃',
            style: TextStyle(fontSize: 35),
          ),
          title: Text(
            'Не забудь добавить своё настроение на сегодня!',
            // maxLines: 2,
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: Const.semiblack,
            ),
          ),
          trailing: GestureDetector(
            onTap: () {
              Get.to(
                () => AddMoodScreen(),
                transition: Transition.rightToLeft,
              );
            },
            child: Container(
                decoration: BoxDecoration(
                    color: Const.turq, borderRadius: BorderRadius.circular(8)),
                height: 40,
                width: 45,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }
}
