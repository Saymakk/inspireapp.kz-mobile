import 'dart:convert';
import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:inspire/constants/bottom_app_bar.dart';
import 'package:inspire/requests/profile/profile.dart';
import 'package:inspire/screens/registration/reg_screen_two.dart';
import 'package:oktoast/oktoast.dart';

GetStorage auth = GetStorage();

Future<void> userUpdateRequest(
  String name,
  String lastName,
  int city,
  String description,
   image,
) async {

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${auth.read('token').toString()}'
  };

  final Uri url = await Uri.parse('https://inspireapp.kz/api/user/update');
  var request = await http.MultipartRequest('POST', url);

  request.headers.addAll(headers);


  request.fields['name'] = name;
  request.fields['last_name'] = lastName;
  request.fields['description'] = description;
  request.fields['city_id'] = city.toString();

  request.files.add(await http.MultipartFile.fromPath("photo", image.path));

  print(request.fields);

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);
  print(responsed.body);

  if (response.statusCode == 200) {
    var data = json.decode(responsed.body);

    print('response.statusCode : ${response.statusCode}');

    debugPrint(data.toString());
    print(response.statusCode);

    print('${data}');

    await profileRequest();

    return Get.offAll(()=>BottomNav());

    // Get.offAllNamed('/tokenCheckPage');
  } else {
    print('text');
  }
  // return Get.defaultDialog(
  //     title: 'CONGRAT',
  //     content: Text('ANYTEXT'),
  //     confirm: IconButton(
  //         onPressed: () {
  //           Get.to(() => BottomNav());
  //         },
  //         icon: Icon(Icons.check)));

  // Get.offAll(() => RegScreenTwo(),
  //     transition: Transition.rightToLeft,
  //     arguments: [data['data']['code'].toString(), r_phone.toString()]);
}
