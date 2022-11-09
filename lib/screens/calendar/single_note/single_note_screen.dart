import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';

class SingleNoteScreen extends StatefulWidget {
  const SingleNoteScreen({Key? key}) : super(key: key);

  @override
  State<SingleNoteScreen> createState() => _SingleNoteScreenState();
}

class _SingleNoteScreenState extends State<SingleNoteScreen> {

  String title = Get.arguments[0];
  String description = Get.arguments[1];
  String emoji = Get.arguments[2];
  String created_at_date = Get.arguments[3];
  String profile_photo_url = Get.arguments[4];
  String created_at_time = Get.arguments[5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,

        // leadingWidth: 24,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff282828),
            )),
        title: Row(
          children: [
            Text(
              created_at_date,
              style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Color(0xff282828),
                    height: 1.645),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Color(0xffe3f8ff),
                  borderRadius: BorderRadius.circular(16)),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  children: [
                    Icon(
                      Icons.access_time_rounded,
                      size: 16,
                      color: Color(0xff649DB0),
                    ),
                    SizedBox(
                      width: 3,
                    ),
                    Text(
                      created_at_time,
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff649DB0),
                            height: 1.645),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      body: SafeArea(
          child: Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 25),
                width: 353,
                height: 354,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black),
                child: Image.network(profile_photo_url, fit: BoxFit.fill,)
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Image.asset(
                      Const.icns + 'chat.png',
                      width: 24,
                      height: 24,
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        height: 1.645,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Text(
                  description,
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff989898),
                    height: 1.3,
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}
