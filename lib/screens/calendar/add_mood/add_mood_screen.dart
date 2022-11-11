import 'dart:async';
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/controllers/success_controller.dart';
import 'package:inspire/requests/create_note/create_note.dart';

class AddMoodScreen extends StatefulWidget {
  const AddMoodScreen({Key? key}) : super(key: key);

  @override
  State<AddMoodScreen> createState() => _AddMoodScreenState();
}

class _AddMoodScreenState extends State<AddMoodScreen> {
  NoteStatusController noteStatusController = Get.put(NoteStatusController());

  TextEditingController noteController = TextEditingController();


  bool selfie = false;

  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(
        source: source,
        maxHeight: 600,
        maxWidth: 800,
        imageQuality: 50,
      );
      if (image == null)
        return;
      else {
        setState(() {
          selfistate();
        });
      }

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed $e');
    }
  }

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

  bool isVisible = true;

  late String smile;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      smile = '';
    });
  }

  @override
  void selfistate() {
    setState(() {
      selfie = true;
    });
  }


  @override
  void dispose() {
    noteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff282828),
            )),
        title: Text(
          'Какое у вас настроение?',
          style: GoogleFonts.poppins(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24, top: 20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Календарь настроения',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600,
                                        color: Const.semiblack)),
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
                                        smile = '😊';

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
                                            // child: Image.asset(
                                            //   Const.icns + 'smile_1.png',
                                            //   height: 46,
                                            // ),
                                            child: Text(
                                              '😊',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 40),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        smile = '😋';

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
                                            // child: Image.asset(
                                            //   Const.icns + 'smile_2.png',
                                            //   height: 46,
                                            // ),
                                            child: Text(
                                              '😋',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 40),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        smile = '😍';

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
                                            // child: Image.asset(
                                            //   Const.icns + 'smile_3.png',
                                            //   height: 46,
                                            // ),
                                            child: Text(
                                              '😍',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 40),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        smile = '😕';

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
                                            // child: Image.asset(
                                            //   Const.icns + 'smile_4.png',
                                            //   height: 46,
                                            // ),
                                            child: Text(
                                              '😕',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 40),
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

                                        smile = '😌';
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
                                            // child: Image.asset(
                                            //   Const.icns + 'smile_5.png',
                                            //   height: 46,
                                            // ),
                                            child: Text(
                                              '😌',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 40),
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

                                        smile = '🙂';
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
                                            // child: Image.asset(
                                            //   Const.icns + 'smile_6.png',
                                            //   height: 46,
                                            // ),
                                            child: Text(
                                              '🙂',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 40),
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

                                        smile = '😴';
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
                                            // child: Image.asset(
                                            //   Const.icns + 'smile_7.png',
                                            //   height: 46,
                                            // ),
                                            child: Text(
                                              '😴',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 40),
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

                                        smile = '😉';
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
                                            // child: Image.asset(
                                            //   Const.icns + 'smile_8.png',
                                            //   height: 46,
                                            // ),
                                            child: Text(
                                              '😉',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 40),
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

                                        smile = '😐';
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
                                            // child: Image.asset(
                                            //   Const.icns + 'smile_9.png',
                                            //   height: 46,
                                            // ),
                                            child: Text(
                                              '😐',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 40),
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

                                        smile = '😤';
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
                                            // child: Image.asset(
                                            //   Const.icns + 'smile_10.png',
                                            //   height: 46,
                                            // ),
                                            child: Text(
                                              '😤',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 40),
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

                                        smile = '😫';
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
                                            // child: Image.asset(
                                            //   Const.icns + 'smile_11.png',
                                            //   height: 46,
                                            // ),
                                            child: Text(
                                              '😫',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 40),
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

                                        smile = '😬';
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
                                            // child: Image.asset(
                                            //   Const.icns + 'smile_12.png',
                                            //   height: 46,
                                            // ),
                                            child: Text(
                                              '😬',
                                              style: GoogleFonts.poppins(
                                                  fontSize: 40),
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
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 24, right: 24, bottom: 10),
                  padding: EdgeInsets.only(
                    left: 16,
                    top: 12,
                  ),
                  height: 100,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffF7FAFB),
                      border: Border.all(color: Color(0xffE5EBED))),
                  child: TextFormField(
                      cursorColor: Color(0xffCFD7D9),
                      maxLines: 3,
                      controller: noteController,
                      onChanged: (text) {
                        setState(() {
                          noteController.text.isEmpty
                              ? isVisible = true
                              : isVisible = false;
                        });
                      },
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                  color: Color(0xffCFD7D9),
                                  fontSize: 14,
                                  height: 1.3))),
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black, fontSize: 14, height: 1.3))),
                ),
                Visibility(
                  visible: isVisible,
                  child: Container(
                      margin: EdgeInsets.only(top: 24, left: 40),
                      child: Row(
                        children: [
                          Image.asset(
                            Const.icns + 'pencil.png',
                            color: Color(0xffCFD7D9),
                            height: 14,
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Добавьте заметку этого дня',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    color: Color(0xffCFD7D9),
                                    fontSize: 14,
                                    height: 1.3)),
                          )
                        ],
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
              child: DottedBorder(
                borderType: BorderType.RRect,
                radius: Radius.circular(8),
                color: Color(0xffDADADA),
                child: Container(
                  padding: EdgeInsets.only(top: 13),
                  // padding: EdgeInsets.only(bottom: 20),
                  child: Container(
                    margin: EdgeInsets.only(top: 10, bottom: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Сделайте селфи',
                                      style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w600,
                                          height: 1.3,
                                          color: Color(0xff282828),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 80,
                                    ),
                                  ],
                                ),
                                Visibility(
                                  visible: selfie,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                            bottom: 10, top: 10),
                                        decoration: Const.cont_turq_circ8,
                                        // padding: EdgeInsets.only(top: 5),
                                        child: Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5, vertical: 5),
                                          child: Center(
                                            child: Text(
                                              'Фото загружено',
                                              style: Const.buttontextstyle,
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 75,
                                      ),
                                    ],
                                  ),
                                ),
                                Text(
                                  'Или загрузите из альбомов',
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      fontSize: 14,
                                      height: 1.3,
                                      color: Color(0xffCFD7D9),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            GestureDetector(
                              onTap: () => pickImage(ImageSource.gallery),
                              child: Container(
                                // margin: EdgeInsets.only(left: 34),
                                padding: EdgeInsets.only(
                                    left: 10.5, right: 10.5, top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                    color: Const.turq,
                                    borderRadius: BorderRadius.circular(8)),
                                height: 40,
                                width: 45,
                                child: Image.asset(
                                  Const.icns + 'from_gallery.png',
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () => pickImage(ImageSource.camera),
                              child: Container(
                                padding: EdgeInsets.only(
                                    left: 10.5, right: 10.5, top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                    color: Const.turq,
                                    borderRadius: BorderRadius.circular(8)),
                                height: 40,
                                width: 45,
                                child: Image.asset(
                                  Const.icns + 'add_photo.png',
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 24, right: 24),
              child: GestureDetector(
                onTap: () async {

                  // setState(() {
                  //   circ = true;
                  //   Timer.periodic(const Duration(seconds: 1), (timer) {
                  //     print(timer.tick);
                  //     if (circ == true) {
                  //       counter--;
                  //     }
                  //     ;
                  //     if (counter == 0) {
                  //       setState(() {
                  //         circ = false;
                  //         counter = 3;
                  //         timer.cancel();
                  //       });
                  //     }
                  //   });
                  // });


                  noteController.text == ''
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Заполните поле для заметок')))
                      : smile == ''
                          ? ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Выберите эмодзи')))
                          : image == null
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Сделайте фото')))
                              : await createNoteRequest(
                                  noteController.text,
                                  smile,
                                  image!,
                                );

                  /** !!! Добавить GET OBS !!! **/
                  // Get.defaultDialog(
                  //   title: 'Ваша заметка успешно сохранена!',
                  //   titleStyle: GoogleFonts.poppins(),
                  //   content: Text(
                  //     'Проведите этот день с пользой!',
                  //     style: GoogleFonts.poppins(),
                  //   ),
                  // );
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  width: double.infinity,
                  height: 40,
                  decoration: Const.cont_turq_circ8,
                  // padding: EdgeInsets.only(top: 5),
                  child: Center(
                    child: Text(
                      'Сохранить своё настроение',
                      style: Const.buttontextstyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
