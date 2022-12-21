import 'dart:ui';

import 'package:InspireApp/widgets/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/courses/courses.dart';
import 'package:InspireApp/requests/courses/single_course.dart';
import 'package:InspireApp/screens/ProfileScreen/profile_screen.dart';
import 'package:InspireApp/screens/courses/single_course/single_course.dart';
import 'package:skeletons/skeletons.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Color(0xffffffff),
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 59),
        child: AppBarWidget(),
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
                            physics: ScrollPhysics(),
                            child: Column(
                              children: <Widget>[
                                ListView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    var course = snapshot.data;
                                    if(course[index].course_contents.length != 0) {
                                      return Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(top: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              course[index].title.toString(),
                                              style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black),
                                            ),
                                            Container(
                                              height: (course[index]
                                                              .course_contents
                                                              .length *
                                                          200 +
                                                      50)
                                                  .toDouble(),
                                              margin: EdgeInsets.only(top: 24),
                                              child: GridView.builder(
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                        crossAxisCount: 2,
                                                        crossAxisSpacing: 2,
                                                        mainAxisSpacing: 0),
                                                itemCount: snapshot.data[index]
                                                    .course_contents.length,
                                                itemBuilder:
                                                    (BuildContext context,
                                                        int index_grid) {
                                                  return Column(
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
                                                                  .width /
                                                              2.3,
                                                          color:
                                                              Color(0xffF7FAFB),
                                                          // padding: EdgeInsets.only(right: 24),
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Color(
                                                                      0xFFC6DAE1),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    topRight: Radius
                                                                        .circular(
                                                                            15),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            15),
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
                                                                          Text(
                                                                            course[index].course_contents[index_grid]['title'],
                                                                            style:
                                                                                GoogleFonts.poppins(
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
                                                  );
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    } else { return SizedBox();}
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
}
