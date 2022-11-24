import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/bottom_app_bar.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/requests/auth/otpAuth.dart';
import 'package:inspire/requests/registering/otpVerify.dart';
import 'package:inspire/screens/auth/authorization_screen.dart';
import 'package:inspire/screens/registration/reg_screen_two.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegScreenOne extends StatefulWidget {
  const RegScreenOne({Key? key}) : super(key: key);

  @override
  State<RegScreenOne> createState() => _RegScreenOneState();
}

class _RegScreenOneState extends State<RegScreenOne> {

  GetStorage auth = GetStorage();

  TextEditingController phoneController = TextEditingController();
  var maskFormatter = new MaskTextInputFormatter(
      mask: '+7 (###) ###-##-##',
      filter: {"#": RegExp(r'[0-9]')},
      type: MaskAutoCompletionType.lazy);

  var counter = 5;
  var active = false;

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
                          'Регистрация',
                          style: Const.black27bold,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: TextFormField(
                        inputFormatters: [maskFormatter],
                        keyboardType: TextInputType.phone,
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: '+7 (___) __-__-  ',
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
                          fillColor: Const.triturq,
                          focusColor: Colors.white,
                          filled: true,
                        )),
                  ),
                  GestureDetector(
                    onTap: () async {


                      setState(() {
                        active = true;
                      });
                      Future.delayed(Duration(seconds: 5)).then((_) {
                        setState(() {
                          active = false;
                        });
                      });

                      // print(phoneController.text);
                      auth.write('phone', phoneController.text);
                       otpAuth(phoneController.text);

                      // Get.to(() => RegScreenTwo(),
                      //     transition: Transition.rightToLeft,
                      //     arguments: [phoneController.text]);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      height: 40,
                      decoration: Const.cont_turq_circ8,
                      // padding: EdgeInsets.only(top: 5),
                      child: Center(
                        child: active == true
                            ? CircularProgressIndicator() : Text(
                          'Зарегистрироваться',
                          style: Const.buttontextstyle,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {

                      Get.to(() => AuthorizationScreen(),
                          transition: Transition.rightToLeft);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 44),
                      width: double.infinity,
                      height: 40,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      // padding: EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          'Уже зарегистрированы?',
                          style: TextStyle(color: Const.turq),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                  // Container(
                  //   padding: EdgeInsets.only(
                  //       left: 19, right: 19, top: 13.5, bottom: 10.5),
                  //   decoration: BoxDecoration(
                  //     color: Const.semiturq,
                  //     borderRadius: BorderRadius.circular(15),
                  //   ),
                  //   child: ListTile(
                  //     leading: Image.asset(
                  //       Const.icns + '!.png',
                  //       height: 37,
                  //     ),
                  //     title: Text(
                  //       'Введите КОД-пароль вашего партнера, чтобы присоединиться к проекту',
                  //       maxLines: 4,
                  //       style: TextStyle(fontSize: 14, color: Const.deepgrey),
                  //     ),
                  //   ),
                  // ),
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
                  //         'Уже зарегистрированы?',
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
                  //       'Введите КОД-пароль вашего партнера, чтобы присоединиться к проекту',
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
          padding: const EdgeInsets.only(
            top: 85,
            left: 24,
            right: 24,
          ),
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
                          'Вы успешно зарегистрированы!',
                          style: Const.black27bold,
                          textAlign: TextAlign.center,
                          maxLines: 3,
                        ),
                      ),
                      Container(
                        width: 302,
                        // child: Text(
                        //   'Вы получите уведомление, когда мы откроем для вас доступ к прилоложению',
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
                    // Get.to(() => MainScreen(),
                    Get.offAll(() => BottomNav(),
                        transition: Transition.rightToLeft);
                  },
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    decoration: Const.cont_turq_circ8,
                    // padding: EdgeInsets.only(top: 5),
                    margin: EdgeInsets.only(bottom: 66),
                    child: Center(
                      child: Text(
                        'Хорошо',
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
