import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:inspire/constants/bottom_app_bar.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/controllers/success_controller.dart';
import 'package:inspire/requests/profile/profile.dart';
import 'package:inspire/screens/registration/reg_screen_two.dart';
import 'package:oktoast/oktoast.dart';

GetStorage auth = GetStorage();

Future<void> affirmDoneRequest(int id) async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${auth.read('token').toString()}'
  };

  final Uri url = await Uri.parse(Const.domain + 'api/user/audio_activity');
  var request = await http.MultipartRequest('POST', url);
  print(Const.domain);
  request.headers.addAll(headers);

  request.fields['content_id'] = id.toString();

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);
  print(responsed.body);
}
