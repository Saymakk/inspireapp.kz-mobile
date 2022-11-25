import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/screens/auth/authorization_screen2.dart';
import 'package:InspireApp/screens/registration/reg_screen_two.dart';
import 'package:oktoast/oktoast.dart';

GetStorage auth = GetStorage();

var phone;

Future<void> otpAuth1(phone) async {

  var r_phone = phone.replaceAll(('-'),'').replaceAll((' '),'').replaceAll((')'),'').replaceAll(('('),'');

  print(r_phone);

  final Uri url = await Uri.parse(Const.domain + 'api/otpAuth');
  var request = await http.MultipartRequest('POST', url);

  request.fields['phone'] = r_phone.toString();

  print(request.fields);

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    var data = await json.decode(responsed.body);

    // print('response.statusCode : ${response.statusCode}');
    // print('data : ${data['data']['code']}');

    auth.write('phone', r_phone);

    debugPrint(auth.read('reg_code').toString());

    Get.to(() => AuthorizationScreen2(),
        transition: Transition.rightToLeft,
        arguments: [data['data']['code'].toString(), r_phone.toString()]);
  } else {
    print('error');
  }
}
