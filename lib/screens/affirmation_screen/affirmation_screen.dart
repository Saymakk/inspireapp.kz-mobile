import 'dart:ui';

import 'package:InspireApp/screens/affirmation_screen/aff_cat_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/widgets/app_bar.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/affirmations/main_screen_affirmations.dart';
import 'package:hive/hive.dart';
import 'package:skeletons/skeletons.dart';

import 'modal_bottom_sheet.dart';
import 'single_affirm/single_aff.dart';

class AffirmationScreen extends ConsumerStatefulWidget {
  const AffirmationScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AffirmationScreen> createState() => _AffirmationScreenState();
}

class _AffirmationScreenState extends ConsumerState<AffirmationScreen> {
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
                              return AffirmModalBottomSheet();
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
                                '${Hive.box('db').get('affirmliked')}',
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
                              width: 320,
                              margin: EdgeInsets.only(top: 20),
                              padding: EdgeInsets.only(
                                  left: 19, right: 19, top: 13.5, bottom: 10.5),
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
                                      fontSize: 14, color: Const.deepgrey),
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
            child: GestureDetector(
              onTap: () {
                Get.to(() => AffCatScreen(),
                    arguments: [affirm.id, affirm.title], );
                //
                // Get.toNamed('aff_cat_screen', parameters: {'id' : affirm.id.toString()},arguments: [affirm.id, affirm.title],);

                // print(affirm.title);
                // Get.to(() => SingleAffScreen(),
                //     transition: Transition.rightToLeft,
                //     arguments: [affirm.title, affirm.length, affirm.id, affirm.path, affirm.description]);
                // singleAffRequest(affirm.id);
              },
              child: ListTile(
                leading: SvgPicture.network(
                  'https://kz.inspireapp.kz/${affirm.icon}',
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
                    print(affirm.contents_count);
                  },
                  child: Container(
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
                        affirm.contents_count.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 22, color: Color(0xff21cac8)),
                      )),
                    ),
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
