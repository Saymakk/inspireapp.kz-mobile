import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/bottom_app_bar.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/requests/auth/authPass.dart';
import 'package:inspire/requests/auth/otpAuth.dart';
import 'package:inspire/requests/registering/otpVerify.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthorizationScreen2 extends StatefulWidget {
  const AuthorizationScreen2({Key? key}) : super(key: key);

  @override
  State<AuthorizationScreen2> createState() => _AuthorizationScreen2State();
}

class _AuthorizationScreen2State extends State<AuthorizationScreen2> {
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

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
                        IconButton(
                            onPressed: () {
                              Get.back();
                            },
                            icon: Icon(Icons.arrow_back_ios)),
                        SizedBox(
                          width: 18,
                        ),
                        Text(
                          'Авторизация',
                          style: Const.black27bold,
                        ),
                      ],
                    ),
                  ),
                  // Container(
                  //   margin: EdgeInsets.only(bottom: 10),
                  //   decoration: Const.input_cont_grey_circ8,
                  //   child: TextFormField(
                  //       inputFormatters: [maskFormatter],
                  //       keyboardType: TextInputType.phone,
                  //       controller: phoneController,
                  //       decoration: InputDecoration(
                  //         hintText: '+7 (___) __-__-  ',
                  //         hintStyle: Const.hint_text_style,
                  //         focusedBorder: OutlineInputBorder(
                  //           borderSide:
                  //               const BorderSide(color: Const.turq, width: 2.0),
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //         enabledBorder: OutlineInputBorder(
                  //           borderSide: const BorderSide(
                  //               color: Const.easygrey, width: 2.0),
                  //           borderRadius: BorderRadius.circular(8.0),
                  //         ),
                  //         contentPadding: EdgeInsets.only(
                  //           left: 20,
                  //           top: 10,
                  //           bottom: 10,
                  //         ),
                  //         focusColor: Colors.white,
                  //         fillColor: Const.triturq,
                  //         filled: true,
                  //       )),
                  // ),
                  Container(
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: Const.input_cont_grey_circ8,
                    child: TextFormField(
                        controller: passwordController..text = Get.arguments[0].toString(),
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

                      authPass(Get.arguments[0], Get.arguments[1]);

                      // Get.offAll(() => BottomNav(),
                      //     transition: Transition.rightToLeft);
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 10),
                      width: double.infinity,
                      height: 40,
                      decoration: Const.cont_turq_circ8,
                      // padding: EdgeInsets.only(top: 5),
                      child: Center(
                        child: Text(
                          'Присоединиться к INSPIRE',
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
