// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:inspire/constants/constants.dart';
// import 'package:inspire/requests/calendar/single_note.dart';
// import 'package:inspire/screens/calendar/single_note/photo_view.dart';
//
// class SingleNoteScreenFB extends StatefulWidget {
//   const SingleNoteScreenFB({Key? key}) : super(key: key);
//
//   @override
//   State<SingleNoteScreenFB> createState() => _SingleNoteScreenFBState();
// }
//
// class _SingleNoteScreenFBState extends State<SingleNoteScreenFB> {
//   String title = Get.arguments[0];
//   String description = Get.arguments[1];
//   String emoji = Get.arguments[2];
//   String created_at_date = Get.arguments[3];
//   String profile_photo_url = Get.arguments[4];
//   String created_at_time = Get.arguments[5];
//
//   String mainDate = Get.arguments[3].substring(0, 10);
//   String date = Get.arguments[3].replaceAll(('-'), '.');
//   String d = Get.arguments[3].substring(8, 10);
//   String m = Get.arguments[3].substring(5, 7);
//   String y = Get.arguments[3].substring(0, 4);
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     print('${d}' + '.' + '${m}' + '.' + '${y}');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         titleSpacing: 0,
//
//         // leadingWidth: 24,
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         leading: IconButton(
//             onPressed: () => Get.back(),
//             icon: Icon(
//               Icons.arrow_back_ios,
//               color: Color(0xff282828),
//             )),
//         title: Row(
//           children: [
//             GestureDetector(
//               onTap: () {},
//               child: Text(
//                 '${d}' + '.' + '${m}' + '.' + '${y}',
//                 style: GoogleFonts.poppins(
//                   textStyle: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w600,
//                       color: Color(0xff282828),
//                       height: 1.645),
//                 ),
//               ),
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Container(
//               decoration: BoxDecoration(
//                   color: Color(0xffe3f8ff),
//                   borderRadius: BorderRadius.circular(16)),
//               child: Container(
//                 margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                 child: Row(
//                   children: [
//                     Icon(
//                       Icons.access_time_rounded,
//                       size: 16,
//                       color: Color(0xff649DB0),
//                     ),
//                     SizedBox(
//                       width: 3,
//                     ),
//                     Text(
//                       created_at_time,
//                       style: GoogleFonts.poppins(
//                         textStyle: TextStyle(
//                             fontSize: 12,
//                             fontWeight: FontWeight.w400,
//                             color: Color(0xff649DB0),
//                             height: 1.645),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//       body: FutureBuilder(
//         // future: singleNoteRequest(mainDate),
//         builder: (BuildContext context, AsyncSnapshot snapshot) {
//           print(snapshot.data);
//           return SafeArea(
//             child: Container(
//               padding: EdgeInsets.symmetric(horizontal: 24),
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     GestureDetector(
//                       onTap: () => Get.to(() => photo_view(), arguments: [
//                         profile_photo_url,
//                       ]),
//                       child: Container(
//                         margin: EdgeInsets.only(bottom: 25),
//                         width: 353,
//                         height: 354,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             color: Colors.black),
//                         child: Image.network(
//                           profile_photo_url,
//                           fit: BoxFit.contain,
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(bottom: 12),
//                       child: Row(
//                         children: [
//                           Image.asset(
//                             Const.icns + 'chat.png',
//                             width: 24,
//                             height: 24,
//                           ),
//                           SizedBox(
//                             width: 12,
//                           ),
//                           Text(
//                             title,
//                             style: GoogleFonts.poppins(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.black,
//                               height: 1.645,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     Container(
//                       child: Text(
//                         description,
//                         style: GoogleFonts.poppins(
//                           fontSize: 14,
//                           fontWeight: FontWeight.w400,
//                           color: Color(0xff989898),
//                           height: 1.3,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/requests/calendar/single_note.dart';
import 'package:inspire/screens/calendar/single_note/photo_view.dart';

class SingleNoteScreenFB extends StatefulWidget {
  const SingleNoteScreenFB({Key? key}) : super(key: key);

  @override
  State<SingleNoteScreenFB> createState() => _SingleNoteScreenFBState();
}

class _SingleNoteScreenFBState extends State<SingleNoteScreenFB> {
  // String title = Get.arguments[0];
  // String description = Get.arguments[1];
  // String emoji = Get.arguments[2];
  // String created_at_date = Get.arguments[3];
  // String profile_photo_url = Get.arguments[4];
  // String created_at_time = Get.arguments[5];
  //
  String mainDate = Get.arguments[0].substring(0, 10);
  String date = Get.arguments[0].replaceAll(('-'), '.');
  String d = Get.arguments[0].substring(8, 10);
  String m = Get.arguments[0].substring(5, 7);
  String y = Get.arguments[0].substring(0, 4);
  var time = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('${d}' + '.' + '${m}' + '.' + '${y}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      body: FutureBuilder(
          future: singleNoteRequest(mainDate),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return Center(
                    child: CircularProgressIndicator(
                  color: Color(0xff21cac8),
                ));
              case ConnectionState.waiting:
                return Center(
                    child: CircularProgressIndicator(
                  color: Color(0xff21cac8),
                ));

              default:
                if(snapshot.data == null) {
                  return Padding(
                    padding: const EdgeInsets.all(24),
                    child: Center(
                      child: Container(
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.only(
                            left: 19, right: 19, top: 13.5, bottom: 10.5),
                        decoration: BoxDecoration(
                          color: Color(0xffFFFEE3),
                          borderRadius: BorderRadius.circular(15), ),
                        child: ListTile(
                          leading: Image.asset(
                            Const.icns + '!.png',
                            height: 37,
                            color: Color(0xffFFDD65),
                          ),
                          title: Text(
                            'Извините, здесь пока ничего нет',
                            maxLines: 4,
                            style: TextStyle(fontSize: 14, color: Const.deepgrey),
                          ),
                        ),
                      ),
                    ),
                  );
                } else {
                  var data = snapshot.data;
                  if (data.created_at != '') {
                    time = data.created_at.substring(11, 16);
                    print(time);
                  }
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
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              // '$mainDate',
                              '${d}' + '.' + '${m}' + '.' + '${y}',
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff282828),
                                    height: 1.645),
                              ),
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
                              margin: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
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
                                    time,
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
                              GestureDetector(
                                onTap: () =>
                                    Get.to(() => photo_view(), arguments: [
                                  data.profile_photo_url,
                                ]),
                                child: Container(
                                  margin: EdgeInsets.only(bottom: 25),
                                  width: 353,
                                  height: 354,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(12),
                                      color: Colors.black),
                                  child: Image.network(
                                    data.profile_photo_url,
                                    fit: BoxFit.contain,
                                  ),
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
                                      data.title,
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
                                  data.description,
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
                      ),
                    ),
                  );
                }
            }
          }),
    );
  }
}
