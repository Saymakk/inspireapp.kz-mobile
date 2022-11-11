import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/requests/courses/courses.dart';
import 'package:inspire/requests/courses/single_course.dart';
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
                                height: 130  ,
                                width: 160,
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
                    child:Container(
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
