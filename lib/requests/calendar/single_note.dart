import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:inspire/constants/constants.dart';
import 'package:inspire/model/mini_courses_model.dart';
import 'package:inspire/model/note_model.dart';
import 'package:inspire/screens/auth/authorization_screen2.dart';
import 'package:inspire/screens/calendar/single_note/single_note_screen.dart';

GetStorage auth = GetStorage();


Future singleNoteRequest(date) async {

  var headers = {
    'Authorization': 'Bearer ${auth.read('token').toString()}'
  };

  final Uri url = await Uri.parse(Const.domain + 'api/user/note/date');
  var request = await http.MultipartRequest('POST', url);
  request.headers.addAll(headers);

  request.fields['date'] = date;

  // print(request.fields);

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    var list = json.decode(responsed.body);

    print(list['id']);

    // List<noteModel> datasheet = list.map((f) => noteModel.fromJson(f)).toList();
    // print('list ${datasheet[0]}');
    list['id'] != null ?
    Get.to(() => SingleNoteScreen(),
        transition: Transition.rightToLeft,
        arguments: [



          list['title'],
          list['description'],
          list['emoji'],
          list['created_at'].substring(0, 10),
          list['profile_photo_url'],
          list['created_at'].substring(11, 16)
        ]) : null;

    // return Future<List<noteModel>>.value(list);
  } else {
    throw Exception('Failed.');
  }
}