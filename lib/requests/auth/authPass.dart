import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:InspireApp/widgets/bottom_app_bar.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/screens/registration/reg_screen_one.dart';
import 'package:InspireApp/screens/registration/reg_screen_two.dart';
import 'package:InspireApp/screens/registration/registering_screen.dart';
import 'package:InspireApp/screens/welcome_screen.dart';
import 'package:oktoast/oktoast.dart';

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
      auth.write('userData', data['data']);
      await Hive.box('mybox').put(0, data['data']['token'].toString());
      // await Hive.box('mybox').put('name2', data['data']['name']);
      await Hive.box('mybox').put(1, data['data']);
      await Hive.box('mybox').put('name', data['data']['user']['name']);


      Get.offAll(() => BottomNav(),
          transition: Transition.rightToLeft, arguments: []);
    } else {
      OKToast(child: Text('Что-то пошло не так! Попробуйте снова.'),);

    }
  }
}
