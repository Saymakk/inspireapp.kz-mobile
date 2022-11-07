import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:inspire/screens/registration/reg_screen_two.dart';
import 'package:oktoast/oktoast.dart';

GetStorage auth = GetStorage();


Future<void> userUpdateRequest() async {



  final Uri url = await Uri.parse('https://inspireapp.kz/api/user/update');
  var request = await http.MultipartRequest('POST', url);

  // request.fields['name'] = r_phone.toString();
  // request.fields['last_name'] = r_phone.toString();
  // request.fields['description'] = r_phone.toString();
  // request.fields['phone'] = r_phone.toString();

  print(request.fields);

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    var data = await json.decode(responsed.body);

    print('response.statusCode : ${response.statusCode}');
    print('data : ${data['data']['code']}');


    debugPrint(auth.read('reg_code').toString());

    // Get.offAll(() => RegScreenTwo(),
    //     transition: Transition.rightToLeft,
    //     arguments: [data['data']['code'].toString(), r_phone.toString()]);
  } else {
    print('error');
  }
}
