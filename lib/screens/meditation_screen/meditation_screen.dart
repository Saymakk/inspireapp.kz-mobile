import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/app_bar.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/requests/meditations/main_screen_meditations.dart';
import 'package:skeletons/skeletons.dart';

import '../ProfileScreen/profile_screen.dart';
import 'modal_bottom_sheet.dart';
import 'player/player_screen.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        extendBody: true,
        backgroundColor: Color(0xffffffff),
        appBar: PreferredSize(
          preferredSize: Size(double.infinity, 59),
          child: AppBarWidget(),
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
                  '🧘 Медитация',
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
                    fontSize: 24,
                  ),
                ),
                Text(
                  'Ежедневные медитации созданы для трансформации человека день за днем',
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
                              'Избранные медитации',
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
                  future: meditationsRequest(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Container(
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 70,
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
                                    height: 70,
                                    width: double.infinity,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 70,
                                    width: double.infinity,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 70,
                                    width: double.infinity,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 70,
                                    width: double.infinity,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 70,
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
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.only(
                                  left: 19, right: 19, top: 13.5, bottom: 10.5),
                              decoration: BoxDecoration(
                                color: Color(0xffFFFEE3),
                                borderRadius: BorderRadius.circular(15), ),
                              child: ListTile(
                                leading: Image.asset(
                                  Const.icns + '!.png',
                                  height: 37,
                                  color: Color(0xffFFDD65),
                                ),
                                title: Text(
                                  'Извините, здесь пока ничего нет',
                                  maxLines: 4,
                                  style: TextStyle(fontSize: 14, color: Const.deepgrey),
                                ),
                              ),
                            ),
                          );
                        } else {
                          return MeditList(snapshot.data, context);
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

  Widget MeditList(List items, context) {
    return Column(
      children: items.map<Widget>(
        (medit) {
          return Container(
            decoration: BoxDecoration(
              color: Const.lowgrey,
              borderRadius: BorderRadius.circular(15),
            ),
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: ListTile(
              isThreeLine: true,
              title: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Text(
                  medit.title,
                  style: GoogleFonts.poppins(
                    textStyle:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              subtitle: Row(
                children: [
                  Icon(Icons.access_time_rounded),
                  Text(' ${medit.length} мин'),
                ],
              ),
              trailing: GestureDetector(
                onTap: () {
                  Get.to(() => PlayerScreen(),
                      transition: Transition.rightToLeft,
                      arguments: [
                        medit.id,
                        medit.title,
                        medit.description,
                        medit.path,
                        medit.length,
                      ]);
                },
                child: CircleAvatar(
                  radius: 22.5,
                  backgroundColor: Const.turq,
                  child: Icon(
                    Icons.play_arrow,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
