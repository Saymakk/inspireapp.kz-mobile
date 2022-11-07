import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/screens/ProfileScreen/profile_screen.dart';
import 'package:inspire/screens/courses/single_course/single_course.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({Key? key}) : super(key: key);

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Color(0xffffffff),
      // appBar: AppBar(
      //   flexibleSpace: ClipRect(
      //     child: BackdropFilter(
      //       filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
      //       child: Container(
      //         color: Colors.transparent,
      //       ),
      //     ),
      //   ),
      //   toolbarHeight: 59,
      //   backgroundColor: Colors.white.withOpacity(.9),
      //   elevation: 0.8,
      //   centerTitle: false,
      //   automaticallyImplyLeading: false,
      //   shadowColor: Const.bottommenuborder,
      //   title: Image.asset(
      //     'assets/images/logo.png',
      //     width: 100,
      //   ),
      //   actions: [
      //     Padding(
      //       padding: const EdgeInsets.only(right: 24.0),
      //       child: GestureDetector(
      //           onTap: () {
      //             Get.to(() => ProfileScreen());
      //           },
      //           child: SvgPicture.asset('assets/icons/profileButton.svg')),
      //     ),
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 2,
                top: 42,
                left: 24,
                right: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Обучение и практика',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Const.semiblack)),
                  ),
                ],
              ),
            ),
            Container(
              // width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  transform: Matrix4.translationValues(24.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: ()=>Get.to(()=>SingleCourseScreen(), transition: Transition.rightToLeft),
                        child: Container(
                          width: 259,
                          margin: EdgeInsets.only(top: 24, right: 15),
                          // padding: EdgeInsets.only(right: 24),
                          child: Column(
                            children: [
                              Container(
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
                                      child: CircleAvatar(
                                          child: Icon(
                                            Icons.play_arrow,
                                            color: Colors.white,
                                            size: 24,
                                          ),
                                          radius: 22.5,
                                          backgroundColor: Color(0xff21cac8)),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'О чем мини-курсы',
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
                                      '18 мин',
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
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Container(
                          width: 259,
                          margin: EdgeInsets.only(top: 24, right: 15),
                          // padding: EdgeInsets.only(right: 24),
                          child: Column(
                            children: [
                              Container(
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
                                      Const.imgs + 'kuralaj_2.png',
                                      fit: BoxFit.fill,
                                    ),
                                    Center(
                                        child: CircleAvatar(
                                            child: Icon(
                                              Icons.play_arrow,
                                              color: Colors.white,
                                              size: 24,
                                            ),
                                            radius: 22.5,
                                            backgroundColor: Color(0xff21cac8)))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      'Введение',
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
                                      '12 мин',
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 22),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Text(
                      'Мини-курсы',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.3,

                          decoration: BoxDecoration(
                              color: Color(0xffF7FAFB),
                              borderRadius: BorderRadius.circular(15)),
                          // padding: EdgeInsets.only(right: 24),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 12),
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
                                margin: EdgeInsets.only(bottom: 17),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'О чем мини-курсы',
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
                                            padding:
                                                const EdgeInsets.only(right: 7),
                                            child: Icon(
                                              Icons.access_time_rounded,
                                              size: 15,
                                              color: Color(0xFF50546A),
                                            ),
                                          ),
                                          Text(
                                            '18 мин',
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
                        Container(
                          width: MediaQuery.of(context).size.width / 2.3,
                          color: Color(0xffF7FAFB),
                          // padding: EdgeInsets.only(right: 24),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 12),
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
                                margin: EdgeInsets.only(bottom: 17),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'О чем мини-курсы',
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
                                            padding:
                                                const EdgeInsets.only(right: 7),
                                            child: Icon(
                                              Icons.access_time_rounded,
                                              size: 15,
                                              color: Color(0xFF50546A),
                                            ),
                                          ),
                                          Text(
                                            '18 мин',
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
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2.3,

                          decoration: BoxDecoration(
                              color: Color(0xffF7FAFB),
                              borderRadius: BorderRadius.circular(15)),
                          // padding: EdgeInsets.only(right: 24),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 12),
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
                                margin: EdgeInsets.only(bottom: 17),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'О чем мини-курсы',
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
                                            padding:
                                                const EdgeInsets.only(right: 7),
                                            child: Icon(
                                              Icons.access_time_rounded,
                                              size: 15,
                                              color: Color(0xFF50546A),
                                            ),
                                          ),
                                          Text(
                                            '18 мин',
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
                        Container(
                          width: MediaQuery.of(context).size.width / 2.3,
                          color: Color(0xffF7FAFB),
                          // padding: EdgeInsets.only(right: 24),
                          child: Column(
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 12),
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
                                margin: EdgeInsets.only(bottom: 17),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Text(
                                            'О чем мини-курсы',
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
                                            padding:
                                                const EdgeInsets.only(right: 7),
                                            child: Icon(
                                              Icons.access_time_rounded,
                                              size: 15,
                                              color: Color(0xFF50546A),
                                            ),
                                          ),
                                          Text(
                                            '18 мин',
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: 2,
                top: 17,
                left: 24,
                right: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Вебинары',
                    style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Const.semiblack)),
                  ),
                ],
              ),
            ),
            Container(
              // width: MediaQuery.of(context).size.width,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  margin: EdgeInsets.only(top: 17),
                  transform: Matrix4.translationValues(24.0, 0.0, 0.0),
                  child: Row(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Color(0xffF7FAFB),
                            borderRadius: BorderRadius.circular(15)),
                        // padding: EdgeInsets.only(right: 24),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 12),
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
                              margin: EdgeInsets.only(bottom: 17),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          'О чем мини-курсы',
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
                                          padding:
                                              const EdgeInsets.only(right: 7),
                                          child: Icon(
                                            Icons.access_time_rounded,
                                            size: 15,
                                            color: Color(0xFF50546A),
                                          ),
                                        ),
                                        Text(
                                          '18 мин',
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
                      ),Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Color(0xffF7FAFB),
                            borderRadius: BorderRadius.circular(15)),
                        // padding: EdgeInsets.only(right: 24),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 12),
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
                              margin: EdgeInsets.only(bottom: 17),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          'О чем мини-курсы',
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
                                          padding:
                                              const EdgeInsets.only(right: 7),
                                          child: Icon(
                                            Icons.access_time_rounded,
                                            size: 15,
                                            color: Color(0xFF50546A),
                                          ),
                                        ),
                                        Text(
                                          '18 мин',
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
                      ),Container(
                        width: MediaQuery.of(context).size.width / 2.3,
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            color: Color(0xffF7FAFB),
                            borderRadius: BorderRadius.circular(15)),
                        // padding: EdgeInsets.only(right: 24),
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 12),
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
                              margin: EdgeInsets.only(bottom: 17),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Row(
                                      children: [
                                        Text(
                                          'О чем мини-курсы',
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
                                          padding:
                                              const EdgeInsets.only(right: 7),
                                          child: Icon(
                                            Icons.access_time_rounded,
                                            size: 15,
                                            color: Color(0xFF50546A),
                                          ),
                                        ),
                                        Text(
                                          '18 мин',
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
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 120,
            ),
          ],
        ),
      ),
    );
  }
}
