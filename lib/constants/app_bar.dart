import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:inspire/requests/profile/profile.dart';
import 'package:inspire/screens/ProfileScreen/profile_screen.dart';

import 'constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
                await userActivities();
               await profileRequest();
                // Get.to(()=>ProfileScreen());
              },
              child: SvgPicture.asset('assets/icons/profileButton.svg')),
        ),
      ],
    );
  }
}
