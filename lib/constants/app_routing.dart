import 'package:InspireApp/screens/ProfileScreen/profile_screen.dart';
import 'package:InspireApp/screens/ProfileScreen/profile_settings/profile_settings.dart';
import 'package:InspireApp/screens/affirmation_screen/aff_cat_screen.dart';
import 'package:InspireApp/screens/affirmation_screen/affirmation_screen.dart';
import 'package:InspireApp/screens/affirmation_screen/single_affirm/single_aff.dart';
import 'package:InspireApp/screens/auth/authorization_screen.dart';
import 'package:InspireApp/screens/calendar/add_mood/add_mood_screen.dart';
import 'package:InspireApp/screens/calendar/all_calendars_screen/all_calendars_screen.dart';
import 'package:InspireApp/screens/calendar/calendar_screen.dart';
import 'package:InspireApp/screens/calendar/single_note/single_note_screen.dart';
import 'package:InspireApp/screens/courses/courses_screen.dart';
import 'package:InspireApp/screens/main_screen/all_affirmations/all_affirmations.dart';
import 'package:InspireApp/screens/main_screen/all_courses/all_courses.dart';
import 'package:InspireApp/screens/main_screen/all_meditations/all_meditations.dart';
import 'package:InspireApp/screens/main_screen/main_screen.dart';
import 'package:InspireApp/screens/meditation_screen/medit_cat_screen.dart';
import 'package:InspireApp/screens/meditation_screen/meditation_screen.dart';
import 'package:InspireApp/screens/registration/reg_screen_one.dart';
import 'package:InspireApp/screens/registration/reg_screen_two.dart';
import 'package:InspireApp/screens/splash_screen.dart';
import 'package:InspireApp/screens/welcome_screen.dart';
import 'package:InspireApp/widgets/bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage<dynamic>> routes = [
    GetPage(name: '/', page: () => SplashScreen()),
    GetPage(name: '/welcome_screen', page: () => WelcomeScreen()),
    GetPage(name: '/reg_screen_one', page: () => RegScreenOne()),
    GetPage(name: '/reg_screen_two', page: () => RegScreenTwo()),
    GetPage(name: '/auth_screen', page: () => AuthorizationScreen()),
    GetPage(
      name: '/inspire',
      page: () => BottomNav(),
      transition: Transition.rightToLeft,
      children: [],
    ),
    //** Профиль **//
    GetPage(name: '/profile', page: () => ProfileScreen(), children: []),
    GetPage(name: '/settings', page: () => ProfileSettingsScreen()),

    //** Главный экран **//
    GetPage(name: '/main_screen', page: () => MainScreen(), children: []),
    GetPage(name: '/all_courses_screen', page: () => AllCoursesScreen()),
    GetPage(name: '/all_aff_screen', page: () => AllAffirmationsScreen()),
    GetPage(name: '/all_medit_screen', page: () => AllMeditationsScreen()),

    //** Экран курсов **//

    GetPage(name: '/courses_screen', page: () => CoursesScreen()),
    //** Экран медитаций **//
    GetPage(
      name: '/medit_screen',
      page: () => MeditationScreen(),
      children: [],
    ),
    GetPage(name: '/medit_cat_:id', page: () => MeditCatScreen(), children: [
      GetPage(name: '/player_screen:id', page: () => AffCatScreen()),
    ]),

    //** Экран аффирмаций **//
    GetPage(
        name: '/affirm_screen', page: () => AffirmationScreen(), children: []),
    GetPage(name: '/aff_cat_:id', page: () => AffCatScreen(), children: []),
    GetPage(name: '/single_aff_:id', page: () => SingleAffScreen()),

    //** Экран календаря **//
    GetPage(
      name: '/calendar',
      page: () => CalendarScreen(),
      children: [],
    ),
    GetPage(
      name: '/all_cal_screen',
      page: () => AllCalendarScreen(),
    ),
    GetPage(
      name: '/add_mood_screen',
      page: () => AddMoodScreen(),
    ),
    GetPage(
      name: '/single_note_screen',
      page: () => SingleNoteScreen(),
    ),
  ];
}
