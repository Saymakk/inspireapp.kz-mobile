import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:InspireApp/constants/bottom_app_bar.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/screens/main_screen/main_screen.dart';
import 'package:InspireApp/screens/registration/reg_agree.dart';
import 'package:InspireApp/screens/registration/reg_screen_two.dart';
import 'package:InspireApp/screens/registration/registering_screen.dart';
import 'package:InspireApp/screens/welcome_screen.dart';

GetStorage auth = GetStorage();

var pass;
var name;
var invite_code;

Future<void> otpVerifyFinal(
  name,
  invite_code,
  pass,
) async {
  final Uri url = await Uri.parse(Const.domain + 'api/otpVerify');
  var request = await http.MultipartRequest('POST', url);

  if (invite_code == '') {
    request.fields['phone'] = auth.read('phone'.toString());
    request.fields['code'] = pass;
    request.fields['name'] = name;
  } else {
    request.fields['phone'] = auth.read('phone'.toString());
    request.fields['code'] = pass;
    request.fields['name'] = name;
    request.fields['invite_code'] = invite_code;
  }
  print(request.fields);

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    var data = await json.decode(responsed.body);

    print('response.statusCode : ${response.statusCode}');
    print('data : ${data['data']['token']}');
    print('data : ${data['data']}');

    auth.write('reg_code', data['data']['code'].toString());
    await Hive.box('mybox').put(0, data['data']['token'].toString());
    await Hive.box('mybox').put(1, data['data']);
    await Hive.box('mybox').put('name', data['data']['user']['name']);

    Get.to(RegisterAgreed());

    // Get.defaultDialog(
    //     title: 'Поздравляем с регистрацией!',
    //     titleStyle: GoogleFonts.poppins(),
    //     contentPadding: EdgeInsets.only(left: 10),
    //     content: Container(
    //       child: Text(
    //         'Вы успешно зарегистрированы! Пока ваш аккаунт не активируют, большая часть функций будет вам недоступна!',
    //         style: GoogleFonts.poppins(),
    //       ),
    //     ),
    //     confirm: TextButton(
    //
    //         onPressed: () {
    //           Get.off(() => WelcomeScreen(),
    //               transition: Transition.rightToLeft,
    //               arguments: [data['data']]);
    //         },
    //         child: Text(
    //           'Продолжить',
    //           textAlign: TextAlign.center,
    //         )));

  } else {
    print('error');
  }
}
