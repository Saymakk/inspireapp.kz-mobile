import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:InspireApp/requests/profile/profile.dart';
import 'package:InspireApp/screens/ProfileScreen/profile_screen.dart';

import '../constants/constants.dart';

class AppBarWidget extends StatefulWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget> {
  bool active = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    active = false;
  }

  var counter = 5;
  bool _allow = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return Future.value(_allow); // if true allow back else block it
      },
      child: AppBar(
        // foregroundColor: Colors.white,
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(
              color: Colors.transparent,
            ),
          ),
        ),
        toolbarHeight: 59,
        backgroundColor: Colors.white.withOpacity(.9),
        elevation: 1,
        centerTitle: false,
        automaticallyImplyLeading: false,
        shadowColor: Const.bottommenuborder,
        title: Image.asset(
          'assets/images/logo.png',
          width: 100,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: GestureDetector(
                onTap: () async {
                  setState(() {
                    active = true;
                  });
                  Future.delayed(Duration(seconds: 5)).then((_) {
                    setState(() {
                      active = false;
                    });
                  });
                  await userActivities();
                  await profileRequest();
                  // Get.to(()=>ProfileScreen());
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Stack(
                    children: [
                      Container(
                          child:
                              SvgPicture.asset('assets/icons/profileButton.svg')),
                      Visibility(
                        visible: active,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
