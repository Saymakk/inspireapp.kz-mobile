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
            'Избранные медитации',
            style: GoogleFonts.poppins(
                fontSize: 20,
                fontWeight: FontWeight.w600,
                color: Color(0xff282828)),
          ),
          Container(
            margin: EdgeInsets.only(top: 5, bottom: 32),
            child: Text(
              'Лайкайте медитации, которые проходите каждый день, чтобы они были в избранном',
              style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xffa5adaf)),
            ),
          ),
          // GestureDetector(
          //   onTap: () =>
          //   {
          //     Get.back(),
          //     Get.to(
          //         () => ThanksScreen(),
          //     transition: Transition.rightToLeft,
          //   ),},
          //   child: Container(
          //     margin: EdgeInsets.only(
          //       bottom: 12,
          //     ),
          //     decoration: BoxDecoration(
          //         borderRadius: BorderRadius.circular(15),
          //         color: Color(0xffE3F8FF)),
          //     child: Container(
          //       margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Image.asset(
          //             Const.icns + 'heart.png',
          //             width: 40,
          //             height: 40,
          //           ),
          //           SizedBox(
          //             width: 23,
          //           ),
          //           Expanded(
          //             child: Text(
          //               'Благодарность',
          //               style: GoogleFonts.poppins(
          //                   color: Color(0xff4f4f4f),
          //                   fontWeight: FontWeight.w600,
          //                   fontSize: 14),
          //             ),
          //           ),
          //           Container(
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               shape: BoxShape.circle,
          //             ),
          //             width: 45,
          //             height: 45,
          //             child: Center(
          //               child: Container(
          //                   // margin: EdgeInsets.all(11),
          //                   child: Text(
          //                 '12',
          //                 style: GoogleFonts.poppins(
          //                     fontSize: 22, color: Color(0xff21cac8)),
          //               )),
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(
          //     bottom: 12,
          //   ),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15),
          //       color: Color(0xffF7FAFB)),
          //   child: Container(
          //     margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Image.asset(
          //           Const.icns + 'heart.png',
          //           width: 40,
          //           height: 40,
          //         ),
          //         SizedBox(
          //           width: 23,
          //         ),
          //         Expanded(
          //           child: Text(
          //             'Богатство',
          //             style: GoogleFonts.poppins(
          //                 color: Color(0xff4f4f4f),
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: 14),
          //           ),
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             shape: BoxShape.circle,
          //           ),
          //           width: 45,
          //           height: 45,
          //           child: Center(
          //             child: Container(
          //                 // margin: EdgeInsets.all(11),
          //                 child: Text(
          //               '8',
          //               style: GoogleFonts.poppins(
          //                   fontSize: 22, color: Color(0xff21cac8)),
          //             )),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          // Container(
          //   margin: EdgeInsets.only(
          //     bottom: 12,
          //   ),
          //   decoration: BoxDecoration(
          //       borderRadius: BorderRadius.circular(15),
          //       color: Color(0xffF7FAFB)),
          //   child: Container(
          //     margin: EdgeInsets.symmetric(horizontal: 17, vertical: 18),
          //     child: Row(
          //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //       children: [
          //         Image.asset(
          //           Const.icns + 'heart.png',
          //           width: 40,
          //           height: 40,
          //         ),
          //         SizedBox(
          //           width: 23,
          //         ),
          //         Expanded(
          //           child: Text(
          //             'Желание',
          //             style: GoogleFonts.poppins(
          //                 color: Color(0xff4f4f4f),
          //                 fontWeight: FontWeight.w600,
          //                 fontSize: 14),
          //           ),
          //         ),
          //         Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             shape: BoxShape.circle,
          //           ),
          //           width: 45,
          //           height: 45,
          //           child: Center(
          //             child: Container(
          //                 // margin: EdgeInsets.all(11),
          //                 child: Text(
          //               '6',
          //               style: GoogleFonts.poppins(
          //                   fontSize: 22, color: Color(0xff21cac8)),
          //             )),
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
