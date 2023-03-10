import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/widgets/bottom_app_bar.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/registering/otpVerify.dart';
import 'package:InspireApp/requests/registering/otpVerifyFinal.dart';
import 'package:InspireApp/screens/auth/authorization_screen.dart';
import 'package:InspireApp/screens/registration/registering_screen.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:oktoast/oktoast.dart';

class RegScreenTwo extends StatefulWidget {
  const RegScreenTwo({Key? key}) : super(key: key);

  @override
  State<RegScreenTwo> createState() => _RegScreenTwoState();
}

class _RegScreenTwoState extends State<RegScreenTwo> {

  var code = Get.arguments[0];
  var phone = Get.arguments[1];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

   // OKToast(child: Text('asdasd'), position: ToastPosition.top,);

  }

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController passController = TextEditingController();

  var counter = 5;
  bool active = false;

  var maskFormatter = new MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Container(
        color: Const.greybg,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.only(top: 80, left: 24, right: 24),
            child: Center(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: Row(
                      children: [
                        Text(
                          '??????????????????????',
                          style: Const.black27bold,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Const.turq, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Const.easygrey, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          hintText: '??????',
                          hintStyle: Const.hint_text_style,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 20,
                            top: 10,
                            bottom: 10,
                          ),
                          focusColor: Colors.white,
                          fillColor: Const.triturq,
                          filled: true,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                        controller: codeController,
                        decoration: InputDecoration(
                          hintText: '??????-????????????',
                          hintStyle: Const.hint_text_style,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Const.turq, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Const.easygrey, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 20,
                            top: 10,
                            bottom: 10,
                          ),
                          focusColor: Colors.white,
                          fillColor: Const.triturq,
                          filled: true,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: TextFormField(
                        controller: passController..text = '${code}',
                        decoration: InputDecoration(
                          hintText: '?????? ??????',
                          hintStyle: Const.hint_text_style,
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                            const BorderSide(color: Const.turq, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                                color: Const.easygrey, width: 2.0),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          contentPadding: EdgeInsets.only(
                            left: 20,
                            top: 10,
                            bottom: 10,
                          ),
                          focusColor: Colors.white,
                          fillColor: Const.triturq,
                          filled: true,
                        )),
                  ),

                  GestureDetector(
                    onTap: () {


                      setState(() {
                        active = true;
                      });
                      Future.delayed(Duration(seconds: 5)).then((_) {
                        setState(() {
                          active = false;
                        });
                      });

                      // Get.to(() => RegAgreed(), transition: Transition.rightToLeft);
                      // otpVerifyFinal(codeController.text, passController.text, nameController.text );
                      otpVerifyFinal(nameController.text, codeController.text, passController.text, );

                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      height: 40,
                      decoration: Const.cont_turq_circ8,
                      // padding: EdgeInsets.only(top: 5),
                      child: Center(
                        child: active == true
                            ? CircularProgressIndicator() :  Text(
                          '????????????????????????????????????',
                          style: Const.buttontextstyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  // GestureDetector(
                  //   onTap: () {
                  //     Get.to(() => AuthorizationScreen(),
                  //         transition: Transition.rightToLeft);
                  //   },
                  //   child: Container(
                  //     margin: EdgeInsets.only(bottom: 44),
                  //     width: double.infinity,
                  //     height: 40,
                  //     decoration:
                  //     BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  //     // padding: EdgeInsets.only(top: 5),
                  //     child: Center(
                  //       child: Text(
                  //         '?????? ?????????????????????????????????',
                  //         style: TextStyle(color: Const.turq),
                  //         textAlign: TextAlign.center,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   padding: EdgeInsets.only(
                  //       left: 19, right: 19, top: 13.5, bottom: 10.5),
                  //   decoration: BoxDecoration(
                  //     color: Const.semiturq,
                  //     borderRadius: BorderRadius.circular(15), ),
                  //   child: ListTile(
                  //     leading: Image.asset(
                  //       Const.icns + '!.png',
                  //       height: 37,
                  //     ),
                  //     title: Text(
                  //       '?????????????? ??????-???????????? ???????????? ????????????????, ?????????? ???????????????????????????? ?? ??????????????',
                  //       maxLines: 4,
                  //       style: TextStyle(fontSize: 14, color: Const.deepgrey),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class RegAgreed extends StatefulWidget {
  const RegAgreed({Key? key}) : super(key: key);

  @override
  State<RegAgreed> createState() => _RegAgreedState();
}

class _RegAgreedState extends State<RegAgreed> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Const.greybg,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 85, left: 24, right: 24, ),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 22),
                        width: 302,
                        child: Text(
                          '???? ?????????????? ????????????????????????????????!',
                          style: Const.black27bold,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                        ),
                      ),
                      Container(
                        width: 302,
                        // child: Text(
                        //   '???? ???????????????? ??????????????????????, ?????????? ???? ?????????????? ?????? ?????? ???????????? ?? ????????????????????????',
                        //   style: Const.black14,
                        //   textAlign: TextAlign.center,
                        //   maxLines: 2,
                        // ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    // print('????????????');
                    // Get.to(() => MainScreen(),
                    Get.offAll(() => BottomNav(),
                        transition: Transition.rightToLeft);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: Const.cont_turq_circ8,
                    // padding: EdgeInsets.only(top: 5),
                    margin: EdgeInsets.only(
                        bottom: 66),
                    child: Center(
                      child: Text(
                        '????????????',
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
    );
  }
}
