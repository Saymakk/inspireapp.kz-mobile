import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inspire/constants/constants.dart';

class DoSelfie extends StatefulWidget {
  const DoSelfie({Key? key}) : super(key: key);

  @override
  State<DoSelfie> createState() => _DoSelfieState();
}

class _DoSelfieState extends State<DoSelfie> {
  File? image;

  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemp = File(image.path);

      setState(() => this.image = imageTemp);
    } on PlatformException catch (e) {
      print('Failed $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, bottom: 20),
      child: DottedBorder(
        borderType: BorderType.RRect,
        radius: Radius.circular(8),
        color: Color(0xffDADADA),
        child: Container(
          padding: EdgeInsets.only(top: 13),
          height: 70,
          margin: EdgeInsets.only(bottom: 20),
          // padding: EdgeInsets.only(bottom: 20),
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
    );
  }
}
