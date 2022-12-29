import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/affirmations/main_screen_affirmations.dart';
import 'package:InspireApp/screens/affirmation_screen/single_affirm/single_aff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skeletons/skeletons.dart';

import '../../requests/affirmations/affirmations_cat.dart';

class AffCatScreen extends StatefulWidget {
  const AffCatScreen({Key? key}) : super(key: key);

  @override
  State<AffCatScreen> createState() => _AffCatScreenState();
}

class _AffCatScreenState extends State<AffCatScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 28,
            ),
          ),
          elevation: 0,
          centerTitle: false,
          backgroundColor: Colors.transparent,
          title: Text(
            Get.arguments[1].toString(),
            style: GoogleFonts.poppins(
              fontWeight: FontWeight.w600,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.all(24),
            child: FutureBuilder(
              future: affirmationsCatRequest(Get.arguments[0]),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.none:
                    return Container(
                      padding: EdgeInsets.only(top: 10),
                      child: SkeletonLine(
                        style: SkeletonLineStyle(
                          height: 48,
                          width: double.infinity,
                          borderRadius: BorderRadius.circular(8),
                        ),
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
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 48,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 48,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 48,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 48,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                      ],
                    );

                  default:
                    // return rideList(snapshot.data, context);

                    if (snapshot.data == null) {
                      return Center(
                        child: Container(
                          width: 320,
                          margin: EdgeInsets.only(top: 20),
                          padding: EdgeInsets.only(
                            left: 19,
                            right: 19,
                            top: 13.5,
                            bottom: 10.5,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0xffFFFEE3),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              Const.icns + '!.png',
                              height: 37,
                              color: Color(0xffFFDD65),
                            ),
                            title: Text(
                              'Извините, здесь пока ничего нет',
                              maxLines: 4,
                              style: TextStyle(
                                fontSize: 14,
                                color: Const.deepgrey,
                              ),
                            ),
                          ),
                        ),
                      );
                    } else {
                      return AffirmList(
                        snapshot.data,
                        context,
                      );
                    }
                }
              },
            ),
            // child: Column(
            //   children: [
            //     Container(
            //       decoration: BoxDecoration(
            //         color: Const.lowgrey,
            //         borderRadius: BorderRadius.circular(15),
            //       ),
            //       margin: EdgeInsets.only(top: 10, bottom: 10),
            //       child: GestureDetector(
            //         onTap: () {
            //           // Get.to(
            //           // () => PlayerScreen(),
            //           // transition: Transition.rightToLeft,
            //           // arguments: [
            //           //   medit.id,
            //           //   medit.title,
            //           //   medit.description,
            //           //   medit.path,
            //           //   medit.length,
            //           // ],
            //           // );
            //         },
            //         child: ListTile(
            //           isThreeLine: true,
            //           title: Padding(
            //             padding: const EdgeInsets.only(bottom: 16),
            //             child: Text(
            //               'medit.title',
            //               style: GoogleFonts.poppins(
            //                 textStyle: TextStyle(
            //                     fontSize: 14, fontWeight: FontWeight.w600),
            //               ),
            //             ),
            //           ),
            //           subtitle: Row(
            //             children: [
            //               Icon(Icons.access_time_rounded),
            //               Text(' 111 мин'),
            //             ],
            //           ),
            //           trailing: CircleAvatar(
            //             radius: 22.5,
            //             backgroundColor: Const.turq,
            //             child: Icon(
            //               Icons.play_arrow,
            //               size: 24,
            //               color: Colors.white,
            //             ),
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),
          ),
        ),
      ),
    );
  }

  Widget AffirmList(List items, context) {
    return SingleChildScrollView(
      child: Column(
        children: items.map<Widget>(
          (affirm) {
            return Container(
              decoration: BoxDecoration(
                color: Const.lowgrey,
                borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: GestureDetector(
                onTap: () {
                  Get.to(
                    () => SingleAffScreen(),
                    transition: Transition.rightToLeft,
                    arguments: [
                      affirm.affirmation_texts,
                      affirm.length,
                      affirm.id,
                      affirm.path,
                      affirm.description,
                    ],
                  );
                },
                child: ListTile(
                  isThreeLine: true,
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Text(
                      affirm.title,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  subtitle: Row(
                    children: [
                      Icon(Icons.access_time_rounded),
                      Text(' ${affirm.length} мин'),
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
      ),
    );
  }
}
