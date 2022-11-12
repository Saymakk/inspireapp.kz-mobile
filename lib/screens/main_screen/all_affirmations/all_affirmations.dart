import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/requests/affirmations/main_screen_affirmations.dart';
import 'package:inspire/requests/affirmations/single_affirm.dart';
import 'package:inspire/requests/meditations/main_screen_meditations.dart';
import 'package:inspire/screens/affirmation_screen/single_affirm/single_aff.dart';
import 'package:inspire/screens/meditation_screen/player/player_screen.dart';
import 'package:skeletons/skeletons.dart';

class AllAffirmationsScreen extends StatefulWidget {
  const AllAffirmationsScreen({Key? key}) : super(key: key);

  @override
  State<AllAffirmationsScreen> createState() => _AllAffirmationsScreenState();
}

class _AllAffirmationsScreenState extends State<AllAffirmationsScreen> {
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
          'Мои аффирмации',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
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
                      return AffirmList(snapshot.data, context);
                    }
                }
              },
            ),
          ],
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
            child: GestureDetector(
              onTap: () {
                // print(affirm.title);
                Get.to(() => SingleAffScreen(),
                    transition: Transition.rightToLeft,
                    arguments: [affirm.title, affirm.length, affirm.id, affirm.path]);
                // singleAffRequest(affirm.id);
              },
              child: ListTile(
                leading: SvgPicture.network(
                  'https://kz.inspireapp.kz/${affirm.subcategory['icon']}',
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
                trailing: Container(
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
