import 'dart:convert';
import 'dart:io';
import 'package:InspireApp/model/meditation_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:InspireApp/widgets/bottom_app_bar.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/controllers/success_controller.dart';
import 'package:InspireApp/requests/profile/profile.dart';
import 'package:InspireApp/screens/registration/reg_screen_two.dart';
import 'package:oktoast/oktoast.dart';

import '../../model/single_affirm.dart';

GetStorage auth = GetStorage();

Future<List<meditationsList>> likedMedit() async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };

  final Uri url = await Uri.parse(Const.domain + 'api/liked/meditation');
  var request = await http.MultipartRequest('GET', url);
  print(Const.domain);
  request.headers.addAll(headers);


  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body);
    List<meditationsList> datasheet =
    list.map((f) => meditationsList.fromJson(f)).toList();

    print(list == [] ? 'null' : 'notnull');
    print(datasheet.length);

    return Future<List<meditationsList>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}
