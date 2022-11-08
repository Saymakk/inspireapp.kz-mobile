import 'dart:ui';
import 'dart:math' as math;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';

class SingleAffScreen extends StatefulWidget {
  const SingleAffScreen({Key? key}) : super(key: key);

  @override
  State<SingleAffScreen> createState() => _SingleAffScreenState();
}

class _SingleAffScreenState extends State<SingleAffScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 2))
        ..repeat();

  bool active = false;

  void activePress() {
    setState(() {
      active = true;
    });
    initState() {}
    ;
  }

  String title = Get.arguments[0];
  int len = Get.arguments[1];

  void inactivePress() {
    setState(() {
      active = false;
    });
  }

  static const colorizeColors = [
    Color(0xff21cac8),
    Colors.white,
  ];


  @override
  dispose() {
    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Const.imgs + 'player_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close)),
          ],
        ),
        extendBodyBehindAppBar: true,
        // extendBody: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 24, right: 24, top: 70),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: active,
                  child: Expanded(
                    child: Container(
                      child: AnimatedTextKit(
                        animatedTexts: [
                          ColorizeAnimatedText(

                              '$title',
                              textStyle: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.center,
                              colors: colorizeColors,
                              speed: Duration(
                                  milliseconds: 200 ),
                            // cursor: '',
                          ),
                        ],
                      ),

                    ),
                  ),
                ),
                Visibility(
                  visible: !active,
                  child: Expanded(
                    child: Text(
                      '$title',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 70,
                  ),
                  child: Stack(
                    children: [
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (_, child) {
                          return Transform.rotate(
                            angle: active == true
                                ? (_controller.value * 2 * math.pi)
                                : 0,
                            child: child,
                          );
                        },
                        child: DottedBorder(
                          dashPattern: [100, 65],
                          color: Colors.white,
                          strokeWidth: 2,
                          borderType: BorderType.Circle,
                          child: Container(
                              margin: EdgeInsets.all(70),
                              child: SizedBox(
                                width: 74,
                                height: 74,
                              )),
                          // child: Container(
                          //
                          //
                          //   margin: EdgeInsets.all(70),
                          //   child: GestureDetector(
                          //     // onTap: () {
                          //     //   setState(() {
                          //     //     active = !active;
                          //     //   });
                          //     // },
                          //     onTapDown: (_)  =>  activePress(),
                          //
                          //     onTapUp: (_)  =>  inactivePress(),
                          //
                          //     child: SvgPicture.asset(
                          //       Const.icns + 'finger.svg',
                          //       color:
                          //       active == true ? Color(0xff21cac8) : Colors.white,
                          //       height: 74,
                          //       width: 74,
                          //     ),
                          //   ),
                          // ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.all(70),
                        child: GestureDetector(
                          // onTap: () {
                          //   setState(() {
                          //     active = !active;
                          //   });
                          // },
                          onTapDown: (_) => activePress(),

                          onTapUp: (_) => inactivePress(),

                          child: SvgPicture.asset(
                            Const.icns + 'finger.svg',
                            color: active == true
                                ? Color(0xff21cac8)
                                : Colors.white,
                            height: 74,
                            width: 74,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
