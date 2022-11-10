import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/requests/meditations/main_screen_meditations.dart';
import 'package:inspire/requests/meditations/main_screen_meditations_with_offset.dart';
import 'package:inspire/screens/main_screen/all_meditations/all_meditations.dart';
import 'package:inspire/screens/meditation_screen/player/player_screen.dart';
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
          Padding(
            padding: const EdgeInsets.only(
              bottom: 2,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          ),
          Column(
            children: [
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
                        ],
                      );

                    default:
                      // return rideList(snapshot.data, context);
                      if (snapshot.data == null) {
                        print(auth.read('token'));
                        return Container(
                            margin: EdgeInsets.only(top: 20),
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: Colors.black)),
                            child: Container(
                                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                                child: Text('Извините, здесь пока ничего нет!', style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w400),)));
                      } else {
                        return MeditList(snapshot.data, context);
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
