import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:inspire/constants/bottom_app_bar.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/screens/registration/reg_screen_one.dart';
import 'package:inspire/screens/registration/reg_screen_two.dart';
import 'package:inspire/screens/registration/registering_screen.dart';
import 'package:inspire/screens/welcome_screen.dart';

GetStorage auth = GetStorage();

var code;
var phone;

Future<void> authPass(code, phone) async {
  final Uri url = await Uri.parse(Const.domain + 'api/otpVerify');
  var request = await http.MultipartRequest('POST', url);

  request.fields['phone'] = phone;
  request.fields['code'] = code;

  // print(request.fields);

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);
  // print(responsed.body);
  if (responsed.body == 'Пользователь не найден пожалуйста зарегистрируйтесь') {
    Get.defaultDialog(
      title: 'Ошибка!',
      content: Text(
          'Пожалуйста, зарегистрируйтесь, прежде чем пользоваться приложением!'),
      confirm: TextButton(
        onPressed: () {
          Get.off(
            () => RegScreenOne(),
          );
        },
        child: Text('Зарегистрироваться'),
      ),
    );
  } else {
    if (response.statusCode == 200) {
      var data = await json.decode(responsed.body);

      print(data['data'].toString());
      // print('response.statusCode : ${response.statusCode}');
      print('data : ${data['data']['token']}');
      // print('data : ${data['data']}');

      auth.write('reg_code', data['data']['code'].toString());
      auth.write('token', data['data']['token'].toString());

      Get.offAll(() => BottomNav(),
          transition: Transition.rightToLeft, arguments: [data['data']]);
    } else { if(response.statusCode != 200) {
      Get.defaultDialog(
        title: 'Что-то пошло не так!',
        content: Text(
            'Пожалуйста, попробуйте снова!'),
        confirm: TextButton(
          onPressed: () {
          Get.back();
          },
          child: Text('Понятно'),
        ),
      );
      }
    }
  }
}
