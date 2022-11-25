import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/screens/welcome_screen.dart';

GetStorage auth = GetStorage();
GetStorage user = GetStorage();

Future<void> profile_delete() async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };

  final Uri url = await Uri.parse(Const.domain + 'api/user/delete');
  var request = await http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    // var data = await json.decode(responsed.body);
    Get.offAll(() => WelcomeScreen());
  } else {
    print('error');
  }
}
