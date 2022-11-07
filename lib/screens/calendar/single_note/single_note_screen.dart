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
              '9 сентября, 2022',
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
                      '17:53',
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
                child: Image.asset(
                  Const.imgs + 'photo.png',
                  fit: BoxFit.fill,
                ),
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
                      'Заметка этого дня',
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
                  'Congue lobortis mauris aliquet mi, nulla sed. Risus odio commodo metus vestibulum. Mi volutpat vestibulum pharetra fringilla consectetur dignissim sociis. Consequat at amet aliquam sodales sit vitae ultrices quam non. Sed morbi quis fringilla urna, ut senectus mattis. Morbi sit blandit.',
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
