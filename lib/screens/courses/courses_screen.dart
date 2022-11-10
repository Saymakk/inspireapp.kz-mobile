import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/requests/courses/courses.dart';
import 'package:inspire/requests/courses/single_course.dart';
import 'package:inspire/screens/ProfileScreen/profile_screen.dart';
import 'package:inspire/screens/courses/single_course/single_course.dart';
import 'package:skeletons/skeletons.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      extendBody: true,
      backgroundColor: Color(0xffffffff),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Мини-курсы',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
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
                                height: 150,
                                width: 170,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 150,
                                width: 170,
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
                                height: 150,
                                width: 170,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 150,
                                width: 170,
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
                                height: 150,
                                width: 170,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 150,
                                width: 170,
                                borderRadius: BorderRadius.circular(15)),
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
                                height: 150,
                                width: 170,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 150,
                                width: 170,
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
                                height: 150,
                                width: 170,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 150,
                                width: 170,
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
                                height: 150,
                                width: 170,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 24, right: 15, left: 15),
                          padding: EdgeInsets.only(top: 10),
                          child: SkeletonLine(
                            style: SkeletonLineStyle(
                                height: 150,
                                width: 170,
                                borderRadius: BorderRadius.circular(15)),
                          ),
                        ),
                      ],
                    ),
                  ],
                );

              default:
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
                                  fontSize: 15, fontWeight: FontWeight.w400),
                            ))),
                  );
                } else {
                  return Container(margin: EdgeInsets.only(top: 10),
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 0),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        return SingleChildScrollView(
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () =>
                                    singleCourse(snapshot.data[index].id),
                                child: Container(
                                  width: MediaQuery.of(context).size.width / 2.3,
                                  color: Color(0xffF7FAFB),
                                  // padding: EdgeInsets.only(right: 24),
                                  child: Column(
                                    children: [
                                      Container(
                                         decoration: BoxDecoration(
                                          color: Color(0xFFC6DAE1),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15),
                                              topLeft: Radius.circular(15)),
                                        ),
                                        child: Stack(
                                          children: [
                                            Image.asset(
                                              Const.imgs + 'kuralaj.png',
                                              fit: BoxFit.fill,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(left: 10, top: 10),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    snapshot.data[index].title,
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
                                              padding:
                                                  const EdgeInsets.only(left: 10, bottom: 10),
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 7),
                                                    child: Icon(
                                                      Icons.access_time_rounded,
                                                      size: 15,
                                                      color: Color(0xFF50546A),
                                                    ),
                                                  ),
                                                  Text(
                                                    '${snapshot.data[index].length} мин',
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
                  );
                }
            }
          },
        ),
      ),
    );
  }
}
