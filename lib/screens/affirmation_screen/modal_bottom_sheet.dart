import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';

import 'thanks/thanks_screen.dart';

class ModalBottomSheet extends StatefulWidget {
  const ModalBottomSheet({Key? key}) : super(key: key);

  @override
  State<ModalBottomSheet> createState() => _ModalBottomSheetState();
}

class _ModalBottomSheetState extends State<ModalBottomSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * .9,
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 23),
      // decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
              alignment: Alignment.topRight,
              child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.close))),
          Text(
            'Избранные аффирмации',
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff282828)),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 32),
            child: Text(
              'Лайкайте аффирмации, которые проходите каждый день, чтобы они были в избранном',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffa5adaf)),
            ),
          ),
          Container(
            width: double.infinity,

            margin: EdgeInsets.only(top: 20),
            padding: EdgeInsets.only(
                left: 19, right: 19, top: 13.5, bottom: 10.5),
            decoration: BoxDecoration(
              color: Color(0xffFFE3E3),
              borderRadius: BorderRadius.circular(15), ),
            child: ListTile(
              leading: Image.asset(
                Const.icns + '!.png',
                height: 37,
                color: Color(0xffFF6565),
              ),
              title: Text(
                'Вы еще не добавили ни одной аффирмации в избранное.',
                maxLines: 4,
                style: TextStyle(fontSize: 14, color: Const.deepgrey),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
