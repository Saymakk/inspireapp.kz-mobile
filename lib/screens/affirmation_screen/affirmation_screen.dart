import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/app_bar.dart';
import 'package:inspire/constants/constants.dart';

import '../ProfileScreen/profile_screen.dart';
import 'modal_bottom_sheet.dart';

class AffirmationScreen extends StatefulWidget {
  const AffirmationScreen({Key? key}) : super(key: key);

  @override
  State<AffirmationScreen> createState() => _AffirmationScreenState();
}

class _AffirmationScreenState extends State<AffirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xffffffff),
        appBar: AppBar(
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
          elevation: 0.8,
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
                  onTap: () {
                    Get.to(() => ProfileScreen());
                  },
                  child: SvgPicture.asset('assets/icons/profileButton.svg')),
            ),
          ],
        ),
        body: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 22,
            vertical: 23,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '🧘 Аффирмация',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Ежедневные аффирмации созданы для трансформации человека день за днем',
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      color: Color(0xffA5ADAF)),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 32,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xffE3F8FF)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                    child: GestureDetector(
                      onTap: (){
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return ModalBottomSheet();
                            });
                      },

                      child: Row(
                        children: [
                          Image.asset(
                            Const.icns + 'heart.png',
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(
                            width: 23,
                          ),
                          Expanded(
                            child: Text(
                              'Избранные аффирмации',
                              style: GoogleFonts.poppins(
                                  color: Color(0xff4f4f4f),
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            width: 45,
                            height: 45,
                            child: Center(
                              child: Container(
                                  // margin: EdgeInsets.all(11),
                                  child: Text(
                                '0',
                                style: GoogleFonts.poppins(
                                    fontSize: 22, color: Color(0xff21cac8)),
                              )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 26),
                    child: Divider(
                      height: 1,
                      color: Color(0xffEDEDED),
                    )),

                Container(
                  margin: EdgeInsets.only(
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff282828)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Const.icns + 'heart_w.png',
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(
                          width: 23,
                        ),

                        Expanded(
                          child: Text(
                            'Благодарность',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        Image.asset(
                          'assets/icons/lock.png',
                          width: 45,
                          height: 45,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     shape: BoxShape.circle,
                        //   ),
                        //   width: 45,
                        //   height: 45,
                        //   child: Center(
                        //     child: Container(
                        //       // margin: EdgeInsets.all(11),
                        //         child: Text(
                        //           '8',
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 22, color: Color(0xff21cac8)),
                        //         )),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff282828)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Const.icns + 'heart_w.png',
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(
                          width: 23,
                        ),

                        Expanded(
                          child: Text(
                            'Богатство',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        Image.asset(
                          'assets/icons/lock.png',
                          width: 45,
                          height: 45,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     shape: BoxShape.circle,
                        //   ),
                        //   width: 45,
                        //   height: 45,
                        //   child: Center(
                        //     child: Container(
                        //       // margin: EdgeInsets.all(11),
                        //         child: Text(
                        //           '8',
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 22, color: Color(0xff21cac8)),
                        //         )),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff282828)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Const.icns + 'heart_w.png',
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(
                          width: 23,
                        ),

                        Expanded(
                          child: Text(
                            'Желания',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        Image.asset(
                          'assets/icons/lock.png',
                          width: 45,
                          height: 45,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     shape: BoxShape.circle,
                        //   ),
                        //   width: 45,
                        //   height: 45,
                        //   child: Center(
                        //     child: Container(
                        //       // margin: EdgeInsets.all(11),
                        //         child: Text(
                        //           '8',
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 22, color: Color(0xff21cac8)),
                        //         )),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff282828)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Const.icns + 'heart_w.png',
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(
                          width: 23,
                        ),

                        Expanded(
                          child: Text(
                            'Защита',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        Image.asset(
                          'assets/icons/lock.png',
                          width: 45,
                          height: 45,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     shape: BoxShape.circle,
                        //   ),
                        //   width: 45,
                        //   height: 45,
                        //   child: Center(
                        //     child: Container(
                        //       // margin: EdgeInsets.all(11),
                        //         child: Text(
                        //           '8',
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 22, color: Color(0xff21cac8)),
                        //         )),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff282828)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Const.icns + 'heart_w.png',
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(
                          width: 23,
                        ),

                        Expanded(
                          child: Text(
                            'Здоровье',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        Image.asset(
                          'assets/icons/lock.png',
                          width: 45,
                          height: 45,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     shape: BoxShape.circle,
                        //   ),
                        //   width: 45,
                        //   height: 45,
                        //   child: Center(
                        //     child: Container(
                        //       // margin: EdgeInsets.all(11),
                        //         child: Text(
                        //           '8',
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 22, color: Color(0xff21cac8)),
                        //         )),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff282828)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Const.icns + 'heart_w.png',
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(
                          width: 23,
                        ),

                        Expanded(
                          child: Text(
                            'Знания',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        Image.asset(
                          'assets/icons/lock.png',
                          width: 45,
                          height: 45,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     shape: BoxShape.circle,
                        //   ),
                        //   width: 45,
                        //   height: 45,
                        //   child: Center(
                        //     child: Container(
                        //       // margin: EdgeInsets.all(11),
                        //         child: Text(
                        //           '8',
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 22, color: Color(0xff21cac8)),
                        //         )),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 12,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff282828)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Const.icns + 'heart_w.png',
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(
                          width: 23,
                        ),

                        Expanded(
                          child: Text(
                            'Истории',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        Image.asset(
                          'assets/icons/lock.png',
                          width: 45,
                          height: 45,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     shape: BoxShape.circle,
                        //   ),
                        //   width: 45,
                        //   height: 45,
                        //   child: Center(
                        //     child: Container(
                        //       // margin: EdgeInsets.all(11),
                        //         child: Text(
                        //           '8',
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 22, color: Color(0xff21cac8)),
                        //         )),
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    bottom: 120,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Color(0xff282828)),
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          Const.icns + 'heart_w.png',
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(
                          width: 23,
                        ),

                        Expanded(
                          child: Text(
                            'Любовь',
                            style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 14),
                          ),
                        ),
                        Image.asset(
                          'assets/icons/lock.png',
                          width: 45,
                          height: 45,
                        ),
                        // Container(
                        //   decoration: BoxDecoration(
                        //     color: Colors.white,
                        //     shape: BoxShape.circle,
                        //   ),
                        //   width: 45,
                        //   height: 45,
                        //   child: Center(
                        //     child: Container(
                        //       // margin: EdgeInsets.all(11),
                        //         child: Text(
                        //           '8',
                        //           style: GoogleFonts.poppins(
                        //               fontSize: 22, color: Color(0xff21cac8)),
                        //         )),
                        //   ),
                        // ),
                      ],
                    ),
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
