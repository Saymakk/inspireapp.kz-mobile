import 'package:InspireApp/requests/affirmations/affirm_done.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class CongratAffirm extends StatefulWidget {
  CongratAffirm({Key? key}) : super(key: key);

  @override
  State<CongratAffirm> createState() => _CongratAffirmState();
}

class _CongratAffirmState extends State<CongratAffirm> {
  GetStorage auth = GetStorage();
var aff_id = Get.arguments[0];
  bool like = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Const.imgs + 'player_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
                Get.back();
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                  Get.back();
                  Get.back();
                },
                icon: Icon(Icons.close)),
          ],
        ),
        extendBodyBehindAppBar: true,
        // extendBody: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 24, right: 24, top: 70),
            child: Center(
              child: Container(
                padding: EdgeInsets.only(left: 24, right: 24, top: 70),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text(
                          'Поздравляем! \nВы прошли аффирмацию!',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          await affirmDoneRequest(aff_id);
                          setState((){
                            like = !like;

                          });
                        },
                        icon: like == false
                            ? Icon(
                                Icons.favorite_border,
                                size: 40,
                                color: Colors.white,
                              )
                            : Icon(Icons.favorite, size: 40, color: Colors.red,),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          print(Hive.box('mybox').get(0));
                          print(aff_id);
                          Get.back();
                          Get.back();
                        },
                        child: Container(
                          width: double.infinity,
                          height: 40,
                          decoration: Const.cont_turq_circ8,
                          // padding: EdgeInsets.only(top: 5),
                          margin: EdgeInsets.only(
                            bottom: 70,
                            top: 15,
                          ),
                          child: Center(
                            child: Text(
                              'Спасибо!',
                              style: Const.buttontextstyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
