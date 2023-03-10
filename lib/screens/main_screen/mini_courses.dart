import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/courses/courses.dart';
import 'package:InspireApp/requests/courses/single_course.dart';
import 'package:InspireApp/screens/main_screen/all_courses/all_courses.dart';
import 'package:skeletons/skeletons.dart';

class MiniCourses extends StatefulWidget {
  const MiniCourses({Key? key}) : super(key: key);

  @override
  State<MiniCourses> createState() => _MiniCoursesState();
}

class _MiniCoursesState extends State<MiniCourses> {
  // AnchorScrollController _scrollController = this.scrollController;
  bool visible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Get.to(
              () => AllCoursesScreen(),
              transition: Transition.rightToLeft,
            );
          },
          child: Container(
            width: double.infinity,
            height: 40,
            decoration: Const.cont_turq_circ8,
            // padding: EdgeInsets.only(top: 5),
            margin: EdgeInsets.only(
              top: 40,
              left: 24,
              right: 24,
            ),
            child: Center(
              child: Text(
                'Открыть все курсы',
                style: Const.buttontextstyle,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),

        // Padding(
        //   padding: const EdgeInsets.only(
        //     bottom: 2,
        //     top: 42,
        //     left: 24,
        //     right: 24,
        //   ),
        // ),
        // FutureBuilder(
        //   future: coursesRequest(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     switch (snapshot.connectionState) {
        //       case ConnectionState.none:
        //         return Container(
        //           margin: EdgeInsets.only(top: 24, right: 15),
        //           padding: EdgeInsets.only(top: 10),
        //           child: SkeletonLine(
        //             style: SkeletonLineStyle(
        //                 height: 150,
        //                 width: 240,
        //                 borderRadius: BorderRadius.circular(15)),
        //           ),
        //         );
        //       case ConnectionState.waiting:
        //         return Container(
        //           child: SingleChildScrollView(
        //             scrollDirection: Axis.horizontal,
        //             child: Row(
        //               children: [
        //                 Container(
        //                   margin: EdgeInsets.only(top: 10, right: 15, left: 24),
        //                   padding: EdgeInsets.only(top: 10),
        //                   child: SkeletonLine(
        //                     style: SkeletonLineStyle(
        //                         height: 150,
        //                         width: 240,
        //                         borderRadius: BorderRadius.circular(15)),
        //                   ),
        //                 ),
        //                 Container(
        //                   margin: EdgeInsets.only(top: 10, right: 15),
        //                   padding: EdgeInsets.only(top: 10),
        //                   child: SkeletonLine(
        //                     style: SkeletonLineStyle(
        //                         height: 150,
        //                         width: 240,
        //                         borderRadius: BorderRadius.circular(15)),
        //                   ),
        //                 ),
        //               ],
        //             ),
        //           ),
        //         );
        //
        //       default:
        //         // return rideList(snapshot.data, context);
        //         if (snapshot.data == null) {
        //           // return Center(
        //           //   child: Container(
        //           //     width: 320,
        //           //     margin: EdgeInsets.only(top: 20),
        //           //     padding: EdgeInsets.only(
        //           //         left: 19,
        //           //         right: 19,
        //           //         top: 13.5,
        //           //         bottom: 10.5),
        //           //     decoration: BoxDecoration(
        //           //       color: Color(0xffFFFEE3),
        //           //       borderRadius: BorderRadius.circular(15),
        //           //     ),
        //           //     child: ListTile(
        //           //       leading: Image.asset(
        //           //         Const.icns + '!.png',
        //           //         height: 37,
        //           //         color: Color(0xffFFDD65),
        //           //       ),
        //           //       title: Text(
        //           //         'Извините, здесь пока ничего нет',
        //           //         maxLines: 4,
        //           //         style: TextStyle(
        //           //             fontSize: 14, color: Const.deepgrey),
        //           //       ),
        //           //     ),
        //           //   ),
        //           // );
        //           return SizedBox();
        //         } else {
        //           return Padding(
        //             padding: const EdgeInsets.only(
        //               bottom: 2,
        //               top: 42,
        //               left: 24,
        //               right: 24,
        //             ),
        //             child: Column(
        //               children: [
        //                 // Row(
        //                 //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //                 //   children: [
        //                 //     Text(
        //                 //       'Мини-курсы',
        //                 //       style: GoogleFonts.poppins(
        //                 //           textStyle: TextStyle(
        //                 //               fontSize: 16,
        //                 //               fontWeight: FontWeight.w600,
        //                 //               color: Const.semiblack)),
        //                 //     ),
        //                 //     GestureDetector(
        //                 //       onTap: () {
        //                 //         Get.to(() => AllCoursesScreen(),
        //                 //             transition: Transition.rightToLeft);
        //                 //       },
        //                 //       child: Text(
        //                 //         'Смотреть все',
        //                 //         style: GoogleFonts.poppins(
        //                 //           textStyle: TextStyle(
        //                 //             fontSize: 16,
        //                 //             fontWeight: FontWeight.w600,
        //                 //             color: Const.turq,
        //                 //           ),
        //                 //         ),
        //                 //       ),
        //                 //     ),
        //                 //   ],
        //                 // ),
        //                 // SingleChildScrollView(
        //                 //     scrollDirection: Axis.horizontal,
        //                 //     child: Container(
        //                 //         transform: Matrix4.translationValues(
        //                 //           24.0,
        //                 //           0.0,
        //                 //           0.0,
        //                 //         ),
        //                 //         child: Row(
        //                 //           children: [
        //                 //             CoursesWidget(
        //                 //               snapshot.data,
        //                 //               context,
        //                 //             ),
        //                 //           ],
        //                 //         ))),
        //               ],
        //             ),
        //           );
        //         }
        //     }
        //   },
        // ),
      ],
    );
  }

  Widget CoursesWidget(List items, context) {
    return Row(
      children: items.map<Widget>(
        (course) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              width: 259,
              margin: EdgeInsets.only(
                top: 24,
                right: 15,
              ),
              // padding: EdgeInsets.only(right: 24),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      // print(course.id);
                      singleCourse(course.id);
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              topLeft: Radius.circular(15),
                            ),
                            child: Image.network(
                              course.picture,
                              fit: BoxFit.cover,
                              width: 259,
                              height: 144,
                            ),
                          ),
                          // Image.asset(
                          //   Const.imgs + 'kuralaj.png',
                          //   fit: BoxFit.fill,
                          // ),
                          Center(
                            child: SvgPicture.asset(
                              Const.icns + 'play_button.svg',
                            ),
                          ),
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
                            ),
                          ),
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
                            ),
                          ),
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
