import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:inspire/constants/bottom_app_bar.dart';
import 'package:inspire/screens/registration/reg_screen_two.dart';
import 'package:inspire/screens/registration/registering_screen.dart';

GetStorage auth = GetStorage();

var code;
var phone;

Future<void> authPass(code, phone) async {


  final Uri url = await Uri.parse('https://inspireapp.kz/api/otpVerify');
  var request = await http.MultipartRequest('POST', url);

  request.fields['phone'] = phone;
  request.fields['code'] = code;

  // print(request.fields);

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  // print(response.statusCode);

  if (response.statusCode == 200) {
    var data = await json.decode(responsed.body);


    // print('response.statusCode : ${response.statusCode}');
    print('data : ${data['data']['token']}');
    // print('data : ${data['data']}');

    auth.write('reg_code', data['data']['code'].toString());
    auth.write('token', data['data']['token'].toString());

    Get.offAll(
            () => BottomNav(),
        transition: Transition.rightToLeft,
        arguments: [data['data']]
    );
  } else {
    print('error');
  }
}

