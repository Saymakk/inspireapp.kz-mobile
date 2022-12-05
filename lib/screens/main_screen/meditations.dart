import 'package:InspireApp/screens/meditation_screen/medit_cat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/meditations/main_screen_meditations.dart';
import 'package:InspireApp/requests/meditations/main_screen_meditations_with_offset.dart';
import 'package:InspireApp/screens/main_screen/all_meditations/all_meditations.dart';
import 'package:InspireApp/screens/meditation_screen/player/player_screen.dart';
import 'package:just_audio/just_audio.dart';
import 'package:skeletons/skeletons.dart';

class Meditations extends StatefulWidget {
  const Meditations({Key? key}) : super(key: key);

  @override
  State<Meditations> createState() => _MeditationsState();
}

class _MeditationsState extends State<Meditations> {
  GetStorage auth = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: Column(
        children: [
          // Padding(
          //   padding: const EdgeInsets.only(
          //     bottom: 2,
          //   ),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Text(
          //         'Ваши медитации',
          //         style: GoogleFonts.poppins(
          //             textStyle: TextStyle(
          //                 fontSize: 16,
          //                 fontWeight: FontWeight.w600,
          //                 color: Const.semiblack)),
          //       ),
          //       GestureDetector(
          //         onTap: () {
          //           Get.to(() => AllMeditationsScreen(),
          //               transition: Transition.rightToLeft);
          //         },
          //         child: Text(
          //           'Смотреть все',
          //           style: GoogleFonts.poppins(
          //               textStyle: TextStyle(
          //                   fontSize: 16,
          //                   fontWeight: FontWeight.w600,
          //                   color: Const.turq)),
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          Column(
            children: [
              FutureBuilder(
                future: meditationsRequestWithOffset(),
                // future: meditationsRequest(),
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
                        ],
                      );

                    default:
                      // return rideList(snapshot.data, context);
                      if (snapshot.data != null) {
                        return Padding(
                          padding: const EdgeInsets.only(
                            bottom: 2,
                            // top: 42,
                          ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Ваши медитации',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w600,
                                            color: Const.semiblack)),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Get.to(() => AllMeditationsScreen(),
                                          transition: Transition.rightToLeft);
                                    },
                                    child: Text(
                                      'Смотреть все',
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: Const.turq)),
                                    ),
                                  ),
                                ],
                              ),
                              MeditList(snapshot.data, context),
                            ],
                          ),
                        );
                        print(auth.read('token'));
                      } else {
                        print(auth.read('token'));
                        return SizedBox();
                        // return Container(
                        //   margin: EdgeInsets.only(top: 20),
                        //   padding: EdgeInsets.only(
                        //       left: 19, right: 19, top: 13.5, bottom: 10.5),
                        //   decoration: BoxDecoration(
                        //     color: Color(0xffFFFEE3),
                        //     borderRadius: BorderRadius.circular(15), ),
                        //   child: ListTile(
                        //     leading: Image.asset(
                        //       Const.icns + '!.png',
                        //       height: 37,
                        //       color: Color(0xffFFDD65),
                        //     ),
                        //     title: Text(
                        //       'Извините, здесь пока ничего нет',
                        //       maxLines: 4,
                        //       style: TextStyle(fontSize: 14, color: Const.deepgrey),
                        //     ),
                        //   ),
                        // );

                      }
                  }
                },
              ),

              // Container(
              //   decoration: BoxDecoration(
              //     color: Const.lowgrey,
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   margin: EdgeInsets.only(top: 10, bottom: 10),
              //   // padding: EdgeInsets.all(15),
              //   child: ListTile(
              //     isThreeLine: true,
              //     title: Padding(
              //       padding: const EdgeInsets.only(bottom: 8.0),
              //       child: Text(
              //         'Медитация избавления от депрессии, тревоги и стресса',
              //         style: GoogleFonts.poppins(
              //           textStyle: TextStyle(
              //               fontSize: 14, fontWeight: FontWeight.w600),
              //         ),
              //       ),
              //     ),
              //     subtitle: Row(
              //       children: [
              //         Icon(Icons.access_time_rounded),
              //         Text(' 20 мин'),
              //       ],
              //     ),
              //     trailing: SvgPicture.asset(Const.icns + 'play_button.svg'),
              //   ),
              // ),
              // Container(
              //   decoration: BoxDecoration(
              //     color: Const.lowgrey,
              //     borderRadius: BorderRadius.circular(15),
              //   ),
              //   margin: EdgeInsets.only(top: 10, bottom: 10),
              //   child: ListTile(
              //     isThreeLine: true,
              //     title: Padding(
              //       padding: const EdgeInsets.only(bottom: 8.0),
              //       child: Text(
              //         'Медитация избавления от депрессии, тревоги и стресса',
              //         style: GoogleFonts.poppins(
              //           textStyle: TextStyle(
              //               fontSize: 14, fontWeight: FontWeight.w600),
              //         ),
              //       ),
              //     ),
              //     subtitle: Row(
              //       children: [
              //         Icon(Icons.access_time_rounded),
              //         Text(' 20 мин'),
              //       ],
              //     ),
              //     trailing: SvgPicture.asset(Const.icns + 'play_button.svg'),
              //   ),
              // ),
            ],
          ),
        ],
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
            margin: EdgeInsets.only(top: 12),
            // padding: EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Get.to(() => MeditCatScreen(),
                    arguments: [medit.id, medit.title]);
                // print(affirm.title);
                // Get.to(() => SingleAffScreen(),
                //     transition: Transition.rightToLeft,
                //     arguments: [affirm.title, affirm.length, affirm.id, affirm.path, affirm.description]);
                // singleAffRequest(affirm.id);
              },
              child: ListTile(
                leading: SvgPicture.network(
                  'https://kz.inspireapp.kz/${medit.icon}',
                  height: 24,
                ),
                title: Text(
                  medit.title,
                  style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: Const.semigrey)),
                ),
                trailing:  Container(
                    decoration: BoxDecoration(
                      color: Const.turq,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 40,
                    width: 45,
                    child: Icon(
                      Icons.play_arrow,
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
