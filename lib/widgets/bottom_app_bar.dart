import 'dart:convert';
import 'dart:ui';

import 'package:InspireApp/requests/affirmations/liked.dart';
import 'package:InspireApp/requests/meditations/likedmedit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/screens/affirmation_screen/affirmation_screen.dart';
import 'package:InspireApp/screens/calendar/calendar_screen.dart';
import 'package:InspireApp/screens/courses/courses_screen.dart';
import 'package:InspireApp/screens/main_screen/main_screen.dart';
import 'package:InspireApp/screens/meditation_screen/meditation_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../constants/constants.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  GetStorage data_list = GetStorage();
  GetStorage auth = GetStorage();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    likedMedit();
    likedAff();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky,
        overlays: [SystemUiOverlay.top]);
    data_list.write('data_list', jsonEncode(auth.read('userData')));
  }

  static const List<Widget> _widgetOptions = <Widget>[
    MainScreen(),
    CoursesScreen(),
    MeditationScreen(),
    AffirmationScreen(),
    CalendarScreen(),
  ];

  int page_index = Hive.box('db').get('page_index') != null ? Hive.box('db').get('page_index') : 0;

  int _selectedIndex = Hive.box('db').get('page_index') != null ? Hive.box('db').get('page_index') : 0;

  // static const TextStyle optionStyle =
  //     TextStyle(fontSize: 9, fontWeight: FontWeight.w500);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  bool _allow = false;

  @override
  Widget build(BuildContext context) {
    print(page_index.toString() + ' current page index');
    print(Hive.box('db').get('page_index').toString() + ' current page index 2');
    Hive.box('db').delete('page_index');
    return WillPopScope(
      onWillPop: () {
        return Future.value(_allow);
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        extendBody: true,
        extendBodyBehindAppBar: true,
        bottomNavigationBar: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 2.0,
              sigmaY: 2.0,
            ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(.9),
                border: Border(
                  top: BorderSide(
                    color: Const.bottommenuborder,
                    width: 1.0,
                  ),
                ),
              ),
              height: 88,
              child: Align(
                alignment: Alignment.topCenter,
                child: ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 2.0,
                      sigmaY: 2.0,
                    ),
                    child: BottomNavigationBar(
                      elevation: 0.0,
                      backgroundColor: Colors.transparent,
                      iconSize: 35,
                      type: BottomNavigationBarType.fixed,

                      // selectedFontSize: 0,
                      selectedLabelStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 9)),
                      unselectedLabelStyle: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 9)),
                      unselectedItemColor: Const.icongrey,
                      selectedItemColor: Const.turq,
                      // showSelectedLabels: true,
                      // showUnselectedLabels: true,
                      items: const <BottomNavigationBarItem>[
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage(Const.icns + 'menu_house.png'),
                            // color: Const.icongrey,
                            // size: 32,
                          ),
                          activeIcon: ImageIcon(
                            AssetImage(Const.icns + 'menu_house.png'),
                            // color: Const.turq,
                            // size: 32,
                          ),
                          label: 'Главная',
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage(Const.icns + 'menu_play.png'),
                            // color: Const.icongrey,
                            // size: 32,
                          ),
                          activeIcon: ImageIcon(
                            AssetImage(Const.icns + 'menu_play.png'),
                            // color: Const.turq,
                            // size: 32,
                          ),
                          label: 'Мини-курсы',
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage(Const.icns + 'menu_medit.png'),
                            // color: Const.icongrey,
                            // size: 32,
                          ),
                          activeIcon: ImageIcon(
                            AssetImage(Const.icns + 'menu_medit.png'),
                            // color: Const.turq,
                            // size: 32,
                          ),
                          label: 'Медитация',
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage(Const.icns + 'menu_brain.png'),
                            // color: Const.icongrey,
                            // size: 32,
                          ),
                          activeIcon: ImageIcon(
                            AssetImage(Const.icns + 'menu_brain.png'),
                            // color: Const.turq,
                            // size: 32,
                          ),
                          label: 'Аффирмация',
                        ),
                        BottomNavigationBarItem(
                          icon: ImageIcon(
                            AssetImage(Const.icns + 'menu_smile.png'),
                            // color: Const.icongrey,
                            // size: 32,
                          ),
                          activeIcon: ImageIcon(
                            AssetImage(Const.icns + 'menu_smile.png'),
                            // color: Const.turq,
                            // size: 32,
                          ),
                          label: 'Календарь',
                        ),
                      ],
                      currentIndex: _selectedIndex,
                      onTap: _onItemTapped,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Container(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
      ),
    );
  }
}
