import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'constants/app_routing.dart';
import 'screens/splash_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();
  bool _allow = false;
  var box = await Hive.openBox('mybox');
  var hive_db = await Hive.openBox('db');

  initializeDateFormatting().then(
    (_) => runApp(
      WillPopScope(
        onWillPop: () {
          return Future.value(_allow); // if true allow back else block it
        },
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetMaterialApp(
        // getPages: AppRoutes.routes,
        debugShowCheckedModeBanner: false,
        title: 'Inspire',
        home: Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
