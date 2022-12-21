import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Const {
  //domains
  static const String domain = 'https://kz.inspireapp.kz/';
  static const String vimeo = 'https://api.vimeo.com/videos/';
  static const String vimeo_token = '7c5917e09bea6f5cd71e3c2fd1a67303';

  //COLORS
  static const greybg = Color.fromRGBO(239, 239, 239, 1);
  static const greyinactive = Color.fromRGBO(229, 235, 237, 1);
  static const turq = Color(0xFF21CAC8);
  static const triturq = Color.fromRGBO(247, 250, 251, 1);
  static const semiturq = Color(0xFFE3FDFF);
  static const easygrey = Color.fromRGBO(222, 236, 236, 1);
  static const bordergrey = Color.fromRGBO(175, 197, 204, 1);
  static const deepgrey = Color(0xFF677B78);
  static const black = Color(0xff282828);
  static const semiblack = Color(0xFF4F4F4F);
  static const semigrey = Color(0xFF6A6A6A);
  static const lowgrey = Color(0xFFF7FAFB);
  static const icongrey = Color(0xFF969C9D);
  static const bottommenuborder = Color(0xFFE5EBED);

  static var cont_turq_circ8 =
      BoxDecoration(color: Const.turq, borderRadius: BorderRadius.circular(8));

  static var cont_white_circ8 =
      BoxDecoration(borderRadius: BorderRadius.circular(8));

  static var input_cont_grey_circ8 = BoxDecoration(
    border: Border.all(color: Const.easygrey),
    borderRadius: BorderRadius.circular(8.0),
  );

  //TEXT STYLES
  static var black27bold = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Color.fromRGBO(40, 40, 40, 1),
    fontSize: 27,
    fontWeight: FontWeight.w600,
    height: 1.3,
  ));

  static var black27boldC = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Color.fromRGBO(40, 40, 40, 1),
    fontSize: 27,
    fontWeight: FontWeight.w600,
    height: 1.3,
  ));

  static var black14 = GoogleFonts.poppins(
      textStyle: TextStyle(
    color: Color.fromRGBO(40, 40, 40, 1),
    fontSize: 14,
  ));

  static var blacksemibold24 = TextStyle(
    color: Color.fromRGBO(40, 40, 40, 1),
    fontSize: 24,
  );

  static var buttontextstyle = GoogleFonts.poppins(
      textStyle: TextStyle(
          fontWeight: FontWeight.bold, fontSize: 14, color: Colors.white));

  static var buttontextturq = GoogleFonts.poppins(
      textStyle: TextStyle(fontWeight: FontWeight.bold, fontSize: 14));

  static var hint_text_style = GoogleFonts.poppins(
    textStyle: TextStyle(
      color: Const.bordergrey,
      fontSize: 14,
    ),
  );

  //DIRECTORIES
  static const String imgs = 'assets/images/';
  static const String icns = 'assets/icons/';
}
