import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:inspire/event_provider/event_provider.dart';
import 'package:inspire/screens/calendar/add_mood/add_mood_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_localizations/syncfusion_localizations.dart';

import 'screens/splash_screen.dart';

Future<void> main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('mybox');
  // Plugin must be initialized before using
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    print('HB1 ${Hive.box('mybox').get(11)}');

    return ChangeNotifierProvider(
      create: (context) => EventProvider(),
      child: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: GetMaterialApp(
          // localizationsDelegates: [
          //   SfGlobalLocalizations.delegate
          // ],
          // locale: const Locale('ru'),
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
