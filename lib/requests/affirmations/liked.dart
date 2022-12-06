import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

Future<List<categoriesAff>> likedAff() async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };

  final Uri url = await Uri.parse(Const.domain + 'api/liked/affirmation');
  var request = await http.MultipartRequest('GET', url);
  print(Const.domain);
  request.headers.addAll(headers);


  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body);
    List<categoriesAff> datasheet =
    list.map((f) => categoriesAff.fromJson(f)).toList();

    print(list.length == 0 ? 'null' : 'notnull');
    print(list.length);
    Hive.box('db').put('affirmliked', datasheet.length);

    return Future<List<categoriesAff>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}
