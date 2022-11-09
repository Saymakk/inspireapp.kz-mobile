import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/app_bar.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/requests/affirmations/main_screen_affirmations.dart';
import 'package:skeletons/skeletons.dart';

import '../ProfileScreen/profile_screen.dart';
import 'modal_bottom_sheet.dart';
import 'single_affirm/single_aff.dart';

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
                      onTap: () {
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

                FutureBuilder(
                  future: affirmationsRequest(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Container(
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 48,
                                width: double.infinity,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        );
                      case ConnectionState.waiting:
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 48,
                                    width: double.infinity,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 48,
                                    width: double.infinity,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 48,
                                    width: double.infinity,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 48,
                                    width: double.infinity,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 48,
                                    width: double.infinity,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                          ],
                        );

                      default:
                        // return rideList(snapshot.data, context);

                        if (snapshot.data == null) {
                          return Center(
                            child: Container(
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.black)),
                                child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Text(
                                      'Извините, здесь пока ничего нет!',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ))),
                          );
                        } else {
                          return AffirmList(snapshot.data, context);
                        }
                    }
                  },
                ),

                // Container(
                //   margin: EdgeInsets.only(
                //     bottom: 12,
                //   ),
                //   decoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(15),
                //       color: Color(0xff282828)),
                //   child: Container(
                //     margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
                //     child: Row(
                //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //       children: [
                //         Image.asset(
                //           Const.icns + 'heart_w.png',
                //           width: 40,
                //           height: 40,
                //         ),
                //         SizedBox(
                //           width: 23,
                //         ),
                //
                //         Expanded(
                //           child: Text(
                //             'Благодарность',
                //             style: GoogleFonts.poppins(
                //                 color: Colors.white,
                //                 fontWeight: FontWeight.w600,
                //                 fontSize: 14),
                //           ),
                //         ),
                //         Image.asset(
                //           'assets/icons/lock.png',
                //           width: 45,
                //           height: 45,
                //         ),
                //         // Container(
                //         //   decoration: BoxDecoration(
                //         //     color: Colors.white,
                //         //     shape: BoxShape.circle,
                //         //   ),
                //         //   width: 45,
                //         //   height: 45,
                //         //   child: Center(
                //         //     child: Container(
                //         //       // margin: EdgeInsets.all(11),
                //         //         child: Text(
                //         //           '8',
                //         //           style: GoogleFonts.poppins(
                //         //               fontSize: 22, color: Color(0xff21cac8)),
                //         //         )),
                //         //   ),
                //         // ),
                //       ],
                //     ),
                //   ),
                // ),

                SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget AffirmList(List items, context) {
    return Column(
      children: items.map<Widget>(
        (affirm) {
          return Container(
            decoration: BoxDecoration(
              color: Const.lowgrey,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.only(top: 12),
            // padding: EdgeInsets.all(20),
            child: ListTile(
              leading: SvgPicture.network(
                'https://inspireapp.kz/${affirm.subcategory['icon']}',
                height: 24,
              ),
              title: Text(
                affirm.title,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: Const.semigrey)),
              ),
              trailing: GestureDetector(
                onTap: () {
                  // print(affirm.title);
                  Get.to(() => SingleAffScreen(),
                      transition: Transition.rightToLeft,
                      arguments: [affirm.title, affirm.length]);
                  // singleAffRequest(affirm.id);
                },
                child: Container(
                    decoration: BoxDecoration(
                        color: Const.turq,
                        borderRadius: BorderRadius.circular(8)),
                    height: 40,
                    width: 45,
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    )),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
