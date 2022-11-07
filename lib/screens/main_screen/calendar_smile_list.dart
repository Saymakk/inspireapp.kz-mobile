import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';

class SmileList extends StatefulWidget {
  const SmileList({Key? key}) : super(key: key);

  @override
  State<SmileList> createState() => _SmileListState();
}

class _SmileListState extends State<SmileList> {

  bool s1 = false;
  bool s2 = false;
  bool s3 = false;
  bool s4 = false;
  bool s5 = false;
  bool s6 = false;
  bool s7 = false;
  bool s8 = false;
  bool s9 = false;
  bool s10 = false;
  bool s11 = false;
  bool s12 = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 24,
            right: 24,
          ),
          child: Column(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Календарь настроения',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: Const.semiblack)),
                      ),
                      GestureDetector(
                        onTap: () {},
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
                  Container(
                      margin: EdgeInsets.only(top: 12, bottom: 38),
                      child: Text(
                        'Отмечай своё настроение каждый день, чтобы проследить за его изменением в течение длительного времени',
                        maxLines: 3,
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                fontSize: 14,
                                color: Color(0xffa5adaf),
                                height: 1.3)),
                      )),
                ],
              ),
              Container(
                margin: EdgeInsets.only(bottom: 22),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                s1 = !s1;
                                s2 = false;
                                s3 = false;
                                s4 = false;
                                s5 = false;
                                s6 = false;
                                s7 = false;
                                s8 = false;
                                s9 = false;
                                s10 = false;
                                s11 = false;
                                s12 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: s1 == true
                                      ? Color(0xffdadada)
                                      : null),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                color: Color(0xffDADADA),
                                // padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 66,
                                    // width: 66,
                                    child: Image.asset(
                                      Const.icns + 'smile_1.png',
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                s1 = false;
                                s2 = !s2;
                                s3 = false;
                                s4 = false;
                                s5 = false;
                                s6 = false;
                                s7 = false;
                                s8 = false;
                                s9 = false;
                                s10 = false;
                                s11 = false;
                                s12 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: s2 == true
                                      ? Color(0xffdadada)
                                      : null),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                color: Color(0xffDADADA),
                                // padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 66,
                                    // width: 66,
                                    child: Image.asset(
                                      Const.icns + 'smile_2.png',
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                s3 = !s3;
                                s2 = false;
                                s1 = false;
                                s4 = false;
                                s5 = false;
                                s6 = false;
                                s7 = false;
                                s8 = false;
                                s9 = false;
                                s10 = false;
                                s11 = false;
                                s12 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: s3 == true
                                      ? Color(0xffdadada)
                                      : null),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                color: Color(0xffDADADA),
                                // padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 66,
                                    // width: 66,
                                    child: Image.asset(
                                      Const.icns + 'smile_3.png',
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                s4 = !s4;
                                s2 = false;
                                s3 = false;
                                s1 = false;
                                s5 = false;
                                s6 = false;
                                s7 = false;
                                s8 = false;
                                s9 = false;
                                s10 = false;
                                s11 = false;
                                s12 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: s4 == true
                                      ? Color(0xffdadada)
                                      : null),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                color: Color(0xffDADADA),
                                // padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 66,
                                    // width: 66,
                                    child: Image.asset(
                                      Const.icns + 'smile_4.png',
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                s5 = !s5;
                                s2 = false;
                                s3 = false;
                                s4 = false;
                                s1 = false;
                                s6 = false;
                                s7 = false;
                                s8 = false;
                                s9 = false;
                                s10 = false;
                                s11 = false;
                                s12 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: s5 == true
                                      ? Color(0xffdadada)
                                      : null),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                color: Color(0xffDADADA),
                                // padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 66,
                                    // width: 66,
                                    child: Image.asset(
                                      Const.icns + 'smile_5.png',
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                s6 = !s6;
                                s2 = false;
                                s3 = false;
                                s4 = false;
                                s5 = false;
                                s1 = false;
                                s7 = false;
                                s8 = false;
                                s9 = false;
                                s10 = false;
                                s11 = false;
                                s12 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: s6 == true
                                      ? Color(0xffdadada)
                                      : null),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                color: Color(0xffDADADA),
                                // padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 66,
                                    // width: 66,
                                    child: Image.asset(
                                      Const.icns + 'smile_6.png',
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                s7 = !s7;
                                s2 = false;
                                s3 = false;
                                s4 = false;
                                s5 = false;
                                s6 = false;
                                s1 = false;
                                s8 = false;
                                s9 = false;
                                s10 = false;
                                s11 = false;
                                s12 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: s7 == true
                                      ? Color(0xffdadada)
                                      : null),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                color: Color(0xffDADADA),
                                // padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 66,
                                    // width: 66,
                                    child: Image.asset(
                                      Const.icns + 'smile_7.png',
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                s8 = !s8;
                                s2 = false;
                                s3 = false;
                                s4 = false;
                                s5 = false;
                                s6 = false;
                                s7 = false;
                                s1 = false;
                                s9 = false;
                                s10 = false;
                                s11 = false;
                                s12 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: s8 == true
                                      ? Color(0xffdadada)
                                      : null),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                color: Color(0xffDADADA),
                                // padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 66,
                                    // width: 66,
                                    child: Image.asset(
                                      Const.icns + 'smile_8.png',
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                s9 = !s9;
                                s2 = false;
                                s3 = false;
                                s4 = false;
                                s5 = false;
                                s6 = false;
                                s7 = false;
                                s8 = false;
                                s1 = false;
                                s10 = false;
                                s11 = false;
                                s12 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: s9 == true
                                      ? Color(0xffdadada)
                                      : null),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                color: Color(0xffDADADA),
                                // padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 66,
                                    // width: 66,
                                    child: Image.asset(
                                      Const.icns + 'smile_9.png',
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                s10 = !s10;
                                s2 = false;
                                s3 = false;
                                s4 = false;
                                s5 = false;
                                s6 = false;
                                s7 = false;
                                s8 = false;
                                s9 = false;
                                s1 = false;
                                s11 = false;
                                s12 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: s10 == true
                                      ? Color(0xffdadada)
                                      : null),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                color: Color(0xffDADADA),
                                // padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 66,
                                    // width: 66,
                                    child: Image.asset(
                                      Const.icns + 'smile_10.png',
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                s11 = !s11;
                                s2 = false;
                                s3 = false;
                                s4 = false;
                                s5 = false;
                                s6 = false;
                                s7 = false;
                                s8 = false;
                                s9 = false;
                                s10 = false;
                                s1 = false;
                                s12 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: s11 == true
                                      ? Color(0xffdadada)
                                      : null),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                color: Color(0xffDADADA),
                                // padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 66,
                                    // width: 66,
                                    child: Image.asset(
                                      Const.icns + 'smile_11.png',
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                s12 = !s12;
                                s2 = false;
                                s3 = false;
                                s4 = false;
                                s5 = false;
                                s6 = false;
                                s7 = false;
                                s8 = false;
                                s9 = false;
                                s10 = false;
                                s11 = false;
                                s1 = false;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius:
                                  BorderRadius.circular(15),
                                  color: s12 == true
                                      ? Color(0xffdadada)
                                      : null),
                              child: DottedBorder(
                                borderType: BorderType.RRect,
                                radius: Radius.circular(15),
                                color: Color(0xffDADADA),
                                // padding: EdgeInsets.all(6),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(12)),
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    // height: 66,
                                    // width: 66,
                                    child: Image.asset(
                                      Const.icns + 'smile_12.png',
                                      height: 46,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
