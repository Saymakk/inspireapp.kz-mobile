import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/constants/bottom_app_bar.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/auth/otpAuth.dart';
import 'package:InspireApp/requests/registering/otpVerify.dart';
import 'package:InspireApp/requests/registering/otpVerifyFinal.dart';
import 'package:InspireApp/screens/auth/authorization_screen.dart';
import 'package:InspireApp/screens/welcome_screen.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class RegisteringScreen extends StatefulWidget {
  const RegisteringScreen({Key? key}) : super(key: key);

  @override
  State<RegisteringScreen> createState() => _RegisteringScreenState();
}

class _RegisteringScreenState extends State<RegisteringScreen> {
  GetStorage auth = GetStorage();

  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController codeController = TextEditingController();

  var pass = Get.arguments[2];

  var counter = 5;
  bool active = false;

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
                          hintText: 'Имя',
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
                          hintText: 'КОД-пароль',
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
                        controller: passController
                          ..text = int.parse(pass).toString(),
                        decoration: InputDecoration(
                          hintText: 'Пароль',
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
                      otpVerifyFinal(codeController.text, passController.text,
                          nameController.text);
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
                    Get.defaultDialog(
                        title: 'Поздравляем с регистрацией!',
                        content: Container(
                          child: Text(
                            'Вы успешно зарегистрированы! Пока ваш аккаунт не активируют, большая часть функций будет вам недоступна!',
                          ),
                        ),
                        confirm: TextButton(
                            onPressed: () {
                              Get.off(
                                () => WelcomeScreen(),
                                transition: Transition.rightToLeft,
                              );
                            },
                            child: Text(
                                'Продолжить'))); // Get.to(() => MainScreen(),
                    // Get.offAll(() => BottomNav(),
                    //     transition: Transition.rightToLeft);
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
