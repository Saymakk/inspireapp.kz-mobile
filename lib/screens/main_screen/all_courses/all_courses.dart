import 'package:InspireApp/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/courses/courses.dart';
import 'package:InspireApp/requests/courses/single_course.dart';
import 'package:InspireApp/requests/meditations/main_screen_meditations.dart';
import 'package:InspireApp/screens/courses/single_course/single_course.dart';
import 'package:InspireApp/screens/meditation_screen/player/player_screen.dart';
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
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text(
          'Все курсы',
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: coursesRequest(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 130,
                              width: 160,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 24,
                            right: 15,
                            left: 15,
                          ),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 130,
                              width: 160,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 24,
                            right: 15,
                            left: 15,
                          ),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 130,
                                width: 160,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 24,
                            right: 15,
                            left: 15,
                          ),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 130,
                                width: 160,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 24,
                            right: 15,
                            left: 15,
                          ),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 130,
                              width: 160,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 24,
                            right: 15,
                            left: 15,
                          ),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                              height: 130,
                              width: 160,
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                );
              case ConnectionState.waiting:
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 130,
                                width: 160,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 130,
                                width: 160,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 130,
                                width: 160,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 130,
                                width: 160,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 130,
                                width: 160,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 130,
                                width: 160,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                  ],
                );

              default:
                if (snapshot.data.length == 0) {
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
                          style: TextStyle(fontSize: 14, color: Const.deepgrey),
                        ),
                      ),
                    ),
                  );
                } else {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          // Container(alignment: Alignment.centerLeft,
                          //     margin: EdgeInsets.only(top: 20),
                          //     child: Text(
                          //       'Мини-курсы',
                          //       style: GoogleFonts.poppins(
                          //           fontSize: 20,
                          //           fontWeight: FontWeight.w600,
                          //           color: Colors.black),
                          //     )),

                          SingleChildScrollView(
                            // physics: ScrollPhysics(),
                            child: Column(
                              children: <Widget>[
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    var course = snapshot.data;
                                    if (course[index].course_contents.length !=
                                        0) {
                                      return Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(top: 20, bottom: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              course[index].title.toString(),
                                              maxLines: 3,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            Container(
                                              height: (course[
                                              index]
                                                  .course_contents
                                                  .length %
                                                  2 ==
                                                  1)
                                                  ? (course[index]
                                                  .course_contents
                                                  .length *
                                                  100 +
                                                  50)
                                                  .toDouble()
                                                  : (course[index]
                                                  .course_contents
                                                  .length *
                                                  80 + 50)
                                                  .toDouble(),
                                              margin: EdgeInsets.only(top: 24),
                                              child: GridView.builder(
                                                physics:
                                                NeverScrollableScrollPhysics(),
                                                gridDelegate:
                                                SliverGridDelegateWithFixedCrossAxisCount(
                                                  crossAxisCount: 2,
                                                  crossAxisSpacing: 2,
                                                  mainAxisSpacing: 10,
                                                ),
                                                itemCount: snapshot.data[index]
                                                    .course_contents.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                    int index_grid) {
                                                  return Container(
                                                    child: Column(
                                                      children: [
                                                        GestureDetector(
                                                          onTap: () {
                                                            // print(course[index].course_contents[index_grid].toString());
                                                            singleCourse(course[
                                                            index]
                                                                .course_contents[
                                                            index_grid]['id']);
                                                          },
                                                          child: Container(
                                                            width: MediaQuery.of(
                                                                context)
                                                                .size
                                                                .width *
                                                                .4,
                                                            color:
                                                            Color(0xffF7FAFB),
                                                            // padding: EdgeInsets.only(right: 24),
                                                            child: Column(
                                                              children: [
                                                                Container(
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    color: Color(
                                                                      0xFFC6DAE1,
                                                                    ),
                                                                    borderRadius:
                                                                    BorderRadius
                                                                        .only(
                                                                      topRight: Radius
                                                                          .circular(
                                                                        15,
                                                                      ),
                                                                      topLeft: Radius
                                                                          .circular(
                                                                        15,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  child: Stack(
                                                                    children: [
                                                                      ClipRRect(
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .only(
                                                                          topRight:
                                                                          Radius.circular(15),
                                                                          topLeft:
                                                                          Radius.circular(15),
                                                                        ),
                                                                        child: Image
                                                                            .network(
                                                                          course[index].course_contents[index_grid]
                                                                          [
                                                                          'picture'],
                                                                          fit: BoxFit
                                                                              .fill,
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                                ),
                                                                Container(
                                                                  child: Column(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                            10,
                                                                            top:
                                                                            10),
                                                                        child:
                                                                        Row(
                                                                          children: [
                                                                            Flexible(
                                                                              child:
                                                                              Text(
                                                                                course[index].course_contents[index_grid]['title'],
                                                                                maxLines: 3,
                                                                                style: GoogleFonts.poppins(
                                                                                  textStyle: TextStyle(
                                                                                    fontWeight: FontWeight.w600,
                                                                                    fontSize: 14,
                                                                                    color: Color(0xff343434),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      Padding(
                                                                        padding: const EdgeInsets
                                                                            .only(
                                                                            left:
                                                                            10,
                                                                            bottom:
                                                                            10),
                                                                        child:
                                                                        Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding:
                                                                              const EdgeInsets.only(right: 7),
                                                                              child:
                                                                              Icon(
                                                                                Icons.access_time_rounded,
                                                                                size: 15,
                                                                                color: Color(0xFF50546A),
                                                                              ),
                                                                            ),
                                                                            Text(
                                                                              '${course[index].course_contents[index_grid]['length']} мин',
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
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else {
                                      return SizedBox();
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          //   height: (snapshot.data.length * 250).toDouble(),
                          //   margin: EdgeInsets.only(top: 24),
                          //   child: GridView.builder (
                          //     gridDelegate:
                          //         SliverGridDelegateWithFixedCrossAxisCount(
                          //             crossAxisCount: 2,
                          //             crossAxisSpacing: 2,
                          //             mainAxisSpacing: 0),
                          //     itemCount: snapshot.data.length,
                          //     itemBuilder: (BuildContext context, int index) {
                          //       return Column(
                          //         children: [
                          //           GestureDetector(
                          //             onTap: () =>
                          //                 singleCourse(snapshot.data[index].id),
                          //             child: Container(
                          //               width:
                          //                   MediaQuery.of(context).size.width / 2.3,
                          //               color: Color(0xffF7FAFB),
                          //               // padding: EdgeInsets.only(right: 24),
                          //               child: Column(
                          //                 children: [
                          //                   Container(
                          //                     decoration: BoxDecoration(
                          //                       color: Color(0xFFC6DAE1),
                          //                       borderRadius: BorderRadius.only(
                          //                         topRight: Radius.circular(15),
                          //                         topLeft: Radius.circular(15),
                          //                       ),
                          //                     ),
                          //                     child: Stack(
                          //                       children: [
                          //                         ClipRRect(
                          //                           borderRadius: BorderRadius.only(
                          //                             topRight: Radius.circular(15),
                          //                             topLeft: Radius.circular(15),
                          //                           ),
                          //                           child: Image.network(
                          //                             snapshot.data[index].picture,
                          //                             fit: BoxFit.fill,
                          //                           ),
                          //                         )
                          //                       ],
                          //                     ),
                          //                   ),
                          //                   Container(
                          //                     child: Column(
                          //                       children: [
                          //                         Padding(
                          //                           padding: const EdgeInsets.only(
                          //                               left: 10, top: 10),
                          //                           child: Row(
                          //                             children: [
                          //                               Text(
                          //                                 snapshot
                          //                                     .data[index].title,
                          //                                 style:
                          //                                     GoogleFonts.poppins(
                          //                                   textStyle: TextStyle(
                          //                                     fontWeight:
                          //                                         FontWeight.w600,
                          //                                     fontSize: 14,
                          //                                     color:
                          //                                         Color(0xff343434),
                          //                                   ),
                          //                                 ),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         ),
                          //                         Padding(
                          //                           padding: const EdgeInsets.only(
                          //                               left: 10, bottom: 10),
                          //                           child: Row(
                          //                             children: [
                          //                               Padding(
                          //                                 padding:
                          //                                     const EdgeInsets.only(
                          //                                         right: 7),
                          //                                 child: Icon(
                          //                                   Icons
                          //                                       .access_time_rounded,
                          //                                   size: 15,
                          //                                   color:
                          //                                       Color(0xFF50546A),
                          //                                 ),
                          //                               ),
                          //                               Text(
                          //                                 '${snapshot.data[index].length} мин',
                          //                                 style:
                          //                                     GoogleFonts.poppins(
                          //                                         textStyle:
                          //                                             TextStyle(
                          //                                   fontWeight:
                          //                                       FontWeight.w500,
                          //                                   fontSize: 12,
                          //                                   color:
                          //                                       Color(0xff343434),
                          //                                 )),
                          //                               ),
                          //                             ],
                          //                           ),
                          //                         )
                          //                       ],
                          //                     ),
                          //                   ),
                          //                 ],
                          //               ),
                          //             ),
                          //           ),
                          //         ],
                          //       );
                          //     },
                          //   ),
                          // ),
                        ],
                      ),
                    ),
                  );
                }
            }
          },
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
                          Image.network(
                            course.picture,
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
