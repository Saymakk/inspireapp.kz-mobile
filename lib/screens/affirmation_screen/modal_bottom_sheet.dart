import 'package:InspireApp/requests/affirmations/liked.dart';
import 'package:InspireApp/screens/affirmation_screen/single_affirm/single_aff.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:skeletons/skeletons.dart';

class AffirmModalBottomSheet extends StatefulWidget {
  const AffirmModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<AffirmModalBottomSheet> createState() => _AffirmModalBottomSheetState();
}

class _AffirmModalBottomSheetState extends State<AffirmModalBottomSheet> {
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
            'Избранные аффирмации',
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff282828)),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 32),
            child: Text(
              'Лайкайте аффирмации, которые проходите каждый день, чтобы они были в избранном',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffa5adaf)),
            ),
          ),
          FutureBuilder(
            future: likedAff(),
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

                  if (snapshot.data.length == 0) {
                    return Container(
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
                          'Вы еще не добавили ни одной аффирмации в избранное.',
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
        ],
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
                // print(affirm.affirmation_texts);
                Get.to(() => SingleAffScreen(),
                    transition: Transition.rightToLeft,
                    arguments: [
                      affirm.affirmation_texts,
                      affirm.length,
                      affirm.id,
                      affirm.path,
                      affirm.description,
                      affirm.affirmation_texts
                    ]);
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
                trailing: GestureDetector(
                  child: Container(
                      decoration: BoxDecoration(
                          color: Const.turq,
                          borderRadius: BorderRadius.circular(8)),
                      height: 40,
                      width: 45,
                      child: Icon(
                        Icons.play_arrow,
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
