import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:InspireApp/widgets/bottom_app_bar.dart';
import 'package:InspireApp/screens/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSplashScreen(
        splash: 'assets/icons/appIcon.png',
        nextScreen:  Hive.box('mybox').get(0) != null ? BottomNav() : WelcomeScreen(),
        splashTransition: SplashTransition.fadeTransition,
      ),
    );
  }
}
