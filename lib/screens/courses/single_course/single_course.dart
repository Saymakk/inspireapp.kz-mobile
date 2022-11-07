import 'dart:io';

import 'package:better_open_file/better_open_file.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';
import 'package:path_provider/path_provider.dart';

class SingleCourseScreen extends StatefulWidget {
  const SingleCourseScreen({Key? key}) : super(key: key);

  @override
  State<SingleCourseScreen> createState() => _SingleCourseScreenState();
}

class _SingleCourseScreenState extends State<SingleCourseScreen> {
  static var httpClient = new HttpClient();

  String course_title = Get.arguments[0];
  String description = Get.arguments[1];
  var length = Get.arguments[2];
  String material_path = Get.arguments[3];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color(0xff282828),
          ),
          iconSize: 24,
        ),
        title: Text(
          course_title.toString(),
          style: GoogleFonts.poppins(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            color: Colors.black,
            height: 1.645,
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 23, vertical: 14),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 25),
                    width: double.infinity,
                    height: 160,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: AssetImage(
                              Const.imgs + 'kuralaj.png',
                            ),
                            fit: BoxFit.cover)),
                  ),
                  CircleAvatar(
                      child: Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 24,
                      ),
                      radius: 22.5,
                      backgroundColor: Color(0xff21cac8))
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Описание урока',
                  style: GoogleFonts.poppins(
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 39),
                child: Text(
                  description,
                  style: GoogleFonts.poppins(
                    height: 1.3,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: Color(0xff989898),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 45),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 13),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Color(0xffE3F8FF)),
                      child: Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: 10, vertical: 3),
                          child: Text('$length мин')),
                    ),
                    Text(
                      'Время прохождения урока',
                      style: GoogleFonts.poppins(
                          color: Color(0xff282828),
                          fontSize: 11,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 39),
                child: Divider(
                  color: Color(0xffbcbcbc),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text(
                  'Материалы к уроку',
                  style: GoogleFonts.poppins(
                    height: 1.2,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                    color: Colors.black,
                  ),
                ),
              ),
              Text(
                'Quis egestas amet nisi, nulla elementum in et nulla. Faucibus venenatis, in euismod ipsum non.',
                style: GoogleFonts.poppins(
                  height: 1.3,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                  color: Color(0xff989898),
                ),
              ),
              GestureDetector(
                onTap: () async {

                    openFile(
                      url:
                      'https://inspireapp.kz/' + material_path,
                      fileName: '${course_title}.doc',
                    );
                    
                  print('https://inspireapp.kz/' + material_path);
                },
                child: Container(
                  width: double.infinity,
                  margin: EdgeInsets.only(top: 25),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xff21cac8)),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          Const.icns + 'from_gallery.png',
                          width: 20,
                          height: 20,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          'Скачать материалы',
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future openFile({required String url, String? fileName}) async {
    final file = await downloadFile(url, fileName!);
    if (file == null) return;
    OpenFile.open(file.path);
  }

  Future<File?> downloadFile(String url, String name) async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/$name');
    try {
      final response = await Dio().get(url,
          options: Options(
            responseType: ResponseType.bytes,
            followRedirects: false,
            receiveTimeout: 0,
          ));
      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      return null;
    }
  }
}
