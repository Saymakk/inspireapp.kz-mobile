import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/model/mini_courses_model.dart';
import 'package:InspireApp/requests/affirmations/main_screen_affirmations.dart';
import 'package:InspireApp/requests/affirmations/main_screen_affirmations_with_offset.dart';
import 'package:InspireApp/requests/affirmations/single_affirm.dart';
import 'package:InspireApp/requests/courses/courses.dart';
import 'package:InspireApp/screens/affirmation_screen/single_affirm/single_aff.dart';
import 'package:InspireApp/screens/main_screen/all_affirmations/all_affirmations.dart';
import 'package:skeletons/skeletons.dart';

class Affirmations extends StatefulWidget {
  const Affirmations({Key? key}) : super(key: key);

  @override
  State<Affirmations> createState() => _AffirmationsState();
}

class _AffirmationsState extends State<Affirmations> {
  GetStorage auth = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: FutureBuilder(
        future: affirmationsRequestWithOffset(),
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
                children: [ Padding(
                  padding: const EdgeInsets.only(
                    bottom: 2,
                    top: 42,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Ваши аффирмации',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Const.semiblack)),
                      ),
                      GestureDetector(
                        onTap: () => Get.to(
                              () => AllAffirmationsScreen(),
                          transition: Transition.rightToLeft,
                        ),
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
                  ),
                ],
              );

            default:
              // return rideList(snapshot.data, context);
              if (snapshot.data == null) {
                print(auth.read('token'));
                return Container(
                  width: 320,

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
                return AffirmList(snapshot.data, context);
              }
          }
        },
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
                // affirmationsRequest();
                Get.to(()=>SingleAffScreen(),
                    transition: Transition.rightToLeft,
                    arguments: [affirm.title, affirm.length, affirm.id, affirm.path]);
                // print(auth.read('token'));
                // print(affirm.icon);
                // print(affirm.title);
                // singleAffRequest();
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
                trailing: GestureDetector(

                  child: Container(
                      decoration: BoxDecoration(
                        color: Const.turq,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 40,
                      width: 45,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
