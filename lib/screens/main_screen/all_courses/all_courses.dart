import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/requests/courses/courses.dart';
import 'package:inspire/requests/meditations/main_screen_meditations.dart';
import 'package:inspire/screens/courses/single_course/single_course.dart';
import 'package:inspire/screens/meditation_screen/player/player_screen.dart';
import 'package:skeletons/skeletons.dart';

class AllCoursesScreen extends StatefulWidget {
  const AllCoursesScreen({Key? key}) : super(key: key);

  @override
  State<AllCoursesScreen> createState() => _AllCoursesScreenState();
}

class _AllCoursesScreenState extends State<AllCoursesScreen> {
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
          'Мои мини-курсы',
          style: GoogleFonts.poppins(
              color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.all(24),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                FutureBuilder(
                  future: coursesRequest(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    switch (snapshot.connectionState) {
                      case ConnectionState.none:
                        return Container(
                          margin: EdgeInsets.only(top: 24, right: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 150,
                                width: 259,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        );
                      case ConnectionState.waiting:
                        return Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 24, right: 15),
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 150,
                                    width: 259,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 24, right: 15),
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 150,
                                    width: 259,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 24, right: 15),
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 150,
                                    width: 259,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 24, right: 15),
                              padding: EdgeInsets.only(top: 10),
                              child: SkeletonLine(
                                style: SkeletonLineStyle(
                                    height: 150,
                                    width: 259,
                                    borderRadius: BorderRadius.circular(15)),
                              ),
                            ),
                          ],
                        );

                      default:
                        // return rideList(snapshot.data, context);
                        if (snapshot.data == null) {
                          return Center(
                            child: Container(
                                margin: EdgeInsets.only(top: 20, bottom: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    border: Border.all(color: Colors.black)),
                                child: Container(
                                    margin: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    child: Text(
                                      'Извините, здесь пока ничего нет!',
                                      style: GoogleFonts.poppins(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400),
                                    ))),
                          );
                        } else {
                          return CoursesWidget(snapshot.data, context);
                        }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget CoursesWidget(List items, context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: items.map<Widget>(
        (course) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 259,
              // padding: EdgeInsets.only(right: 24),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(() => SingleCourseScreen(),
                          transition: Transition.rightToLeft,
                          arguments: [
                            course.title,
                            course.description,
                            course.length.toString(),
                            course.material_path,
                          ]);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 12),
                      width: 259,
                      height: 144,
                      decoration: BoxDecoration(
                        color: Color(0xFFC6DAE1),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          Image.asset(
                            Const.imgs + 'kuralaj.png',
                            fit: BoxFit.fill,
                          ),
                          Center(
                              child: SvgPicture.asset(
                                  Const.icns + 'play_button.svg'))
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Text(
                          course.title,
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                            color: Color(0xff343434),
                          )),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 7),
                          child: Icon(
                            Icons.access_time_rounded,
                            size: 15,
                            color: Color(0xFF50546A),
                          ),
                        ),
                        Text(
                          '${course.length.toString()} мин',
                          style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: Color(0xff343434),
                          )),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ).toList(),
    );
  }
}
