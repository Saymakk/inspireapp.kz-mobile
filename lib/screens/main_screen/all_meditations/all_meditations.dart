import 'package:InspireApp/screens/meditation_screen/medit_cat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/meditations/main_screen_meditations.dart';
import 'package:InspireApp/screens/meditation_screen/player/player_screen.dart';
import 'package:skeletons/skeletons.dart';

class AllMeditationsScreen extends StatefulWidget {
  const AllMeditationsScreen({Key? key}) : super(key: key);

  @override
  State<AllMeditationsScreen> createState() => _AllMeditationsScreenState();
}

class _AllMeditationsScreenState extends State<AllMeditationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Мои медитации',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(24),
        
        child: SingleChildScrollView(
          child: Column(
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
                        return Container(                                width: 320,

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
                        );
                      } else {
                        return MeditList(snapshot.data, context);
                      }
                  }
                },
              ),

            ],
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
