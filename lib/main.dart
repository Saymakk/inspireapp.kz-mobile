import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspire/event_provider/event_provider.dart';
import 'package:inspire/screens/calendar/add_mood/add_mood_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';

import 'screens/splash_screen.dart';

Future<void> main() async {

  // Plugin must be initialized before using
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Inspire',
          home: Scaffold(
            body: SplashScreen(),
          ),
        ),
      ),
    );
  }
}
