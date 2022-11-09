import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:inspire/constants/bottom_app_bar.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/screens/registration/reg_screen_two.dart';
import 'package:inspire/screens/registration/registering_screen.dart';

GetStorage auth = GetStorage();

var pass;
var name;
var invite_code;

Future<void> otpVerifyFinal(
  name,
  invite_code,
  pass,
) async {
  final Uri url = await Uri.parse('https://inspireapp.kz/api/otpVerify');
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

    Get.defaultDialog(
        title: 'Поздравляем с регистрацией!',
        titleStyle: GoogleFonts.poppins(),
        contentPadding: EdgeInsets.only(left: 10),
        content: Container(
          child: Text(
            'Вы унаспешно зарегестрированы! Пока ваш аккаунт не активируют, большая часть функций будет вам недоступ',
            style: GoogleFonts.poppins(),
          ),
        ),
        confirm: TextButton(

            onPressed: () {
              Get.to(() => BottomNav(),
                  transition: Transition.rightToLeft,
                  arguments: [data['data']]);
            },
            child: Text(
              'Продолжить',
              textAlign: TextAlign.center,
            )));
  } else {
    print('error');
  }
}
