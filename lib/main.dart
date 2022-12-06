import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'screens/splash_screen.dart';

final affLikedProvider = StateProvider((ref) => '');
final meditLikedProvider = StateProvider((ref) => '');

Future<void> main() async {
  await Hive.initFlutter();
  bool _allow = false;
  var box = await Hive.openBox('mybox');
  var hive_db = await Hive.openBox('db');
  // Plugin must be initialized before using

  initializeDateFormatting().then(
    (_) => runApp(
      WillPopScope(
        onWillPop: () {
          return Future.value(_allow); // if true allow back else block it
        },
        child: ProviderScope(
          child: MyApp(),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // print('HB1 ${Hive.box('mybox').get(11)}');

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: GetMaterialApp(

        debugShowCheckedModeBanner: false,
        title: 'Inspire',
        home: Scaffold(
          body: SplashScreen(),
        ),
      ),
    );
  }
}
