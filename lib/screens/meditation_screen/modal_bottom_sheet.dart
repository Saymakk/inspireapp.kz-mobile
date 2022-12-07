import 'package:InspireApp/requests/meditations/likedmedit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:skeletons/skeletons.dart';

import 'player/player_screen.dart';
import 'thanks/thanks_screen.dart';

class MeditModalBottomSheet extends StatefulWidget {
  const MeditModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<MeditModalBottomSheet> createState() => _MeditModalBottomSheetState();
}

class _MeditModalBottomSheetState extends State<MeditModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .9,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 23),
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close))),
          Text(
            'Избранные медитации',
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff282828)),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 32),
            child: Text(
              'Лайкайте медитации, которые проходите каждый день, чтобы они были в избранном',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffa5adaf)),
            ),
          ),

          FutureBuilder(
            future: likedMedit(),
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
                      child: MeditList(snapshot.data, context),
                    );
                    print(auth.read('token'));
                  } else {
                    print(auth.read('token'));
                    return Center(
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(
                            left: 19, right: 19, top: 13.5, bottom: 10.5),
                        decoration: BoxDecoration(
                          color: Color(0xffFFE3E3),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: ListTile(
                          leading: Image.asset(
                            Const.icns + '!.png',
                            height: 37,
                            color: Color(0xffFF6565),
                          ),
                          title: Text(
                            'Вы еще не добавили ни одной медитации в избранное.',
                            maxLines: 4,
                            style:
                                TextStyle(fontSize: 14, color: Const.deepgrey),
                          ),
                        ),
                      ),
                    );
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

          // GestureDetector(
          //   onTap: () =>
          //   {
          //     Get.back(),
          //     Get.to(
          //         () => ThanksScreen(),
          //     transition: Transition.rightToLeft,
          //   ),},
          //   child: Container(
          //     margin: EdgeInsets.only(
          //       bottom: 12,
          //     ),
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(15),
          //         color: Color(0xffE3F8FF)),
          //     child: Container(
          //       margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Image.asset(
          //             Const.icns + 'heart.png',
          //             width: 40,
          //             height: 40,
          //           ),
          //           SizedBox(
          //             width: 23,
          //           ),
          //           Expanded(
          //             child: Text(
          //               'Благодарность',
          //               style: GoogleFonts.poppins(
          //                   color: Color(0xff4f4f4f),
          //                   fontWeight: FontWeight.w600,
          //                   fontSize: 14),
          //             ),
          //           ),
          //           Container(
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               shape: BoxShape.circle,
          //             ),
          //             width: 45,
          //             height: 45,
          //             child: Center(
          //               child: Container(
          //                   // margin: EdgeInsets.all(11),
          //                   child: Text(
          //                 '12',
          //                 style: GoogleFonts.poppins(
          //                     fontSize: 22, color: Color(0xff21cac8)),
          //               )),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(
          //     bottom: 12,
          //   ),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15),
          //       color: Color(0xffF7FAFB)),
          //   child: Container(
          //     margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Image.asset(
          //           Const.icns + 'heart.png',
          //           width: 40,
          //           height: 40,
          //         ),
          //         SizedBox(
          //           width: 23,
          //         ),
          //         Expanded(
          //           child: Text(
          //             'Богатство',
          //             style: GoogleFonts.poppins(
          //                 color: Color(0xff4f4f4f),
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: 14),
          //           ),
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             shape: BoxShape.circle,
          //           ),
          //           width: 45,
          //           height: 45,
          //           child: Center(
          //             child: Container(
          //                 // margin: EdgeInsets.all(11),
          //                 child: Text(
          //               '8',
          //               style: GoogleFonts.poppins(
          //                   fontSize: 22, color: Color(0xff21cac8)),
          //             )),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(
          //     bottom: 12,
          //   ),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15),
          //       color: Color(0xffF7FAFB)),
          //   child: Container(
          //     margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Image.asset(
          //           Const.icns + 'heart.png',
          //           width: 40,
          //           height: 40,
          //         ),
          //         SizedBox(
          //           width: 23,
          //         ),
          //         Expanded(
          //           child: Text(
          //             'Желание',
          //             style: GoogleFonts.poppins(
          //                 color: Color(0xff4f4f4f),
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: 14),
          //           ),
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             shape: BoxShape.circle,
          //           ),
          //           width: 45,
          //           height: 45,
          //           child: Center(
          //             child: Container(
          //                 // margin: EdgeInsets.all(11),
          //                 child: Text(
          //               '6',
          //               style: GoogleFonts.poppins(
          //                   fontSize: 22, color: Color(0xff21cac8)),
          //             )),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
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
            child: GestureDetector(
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
              child: ListTile(
                isThreeLine: true,
                title: Padding(
                  padding: const EdgeInsets.only(bottom: 16),
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
                trailing: CircleAvatar(
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
