// import 'dart:convert';
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:http/http.dart' as http;
// import 'package:InspireApp/constants/constants.dart';
// import 'package:InspireApp/model/mini_courses_model.dart';
// import 'package:InspireApp/model/note_model.dart';
// import 'package:InspireApp/screens/auth/authorization_screen2.dart';
// import 'package:InspireApp/screens/calendar/single_note/single_note_screen.dart';
//
// GetStorage auth = GetStorage();
//
//
// Future singleNoteRequest(date) async {
//
//   var headers = {
//     'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
//   };
//
//   final Uri url = await Uri.parse(Const.domain + 'api/user/note/date');
//   var request = await http.MultipartRequest('POST', url);
//   request.headers.addAll(headers);
//
//   request.fields['date'] = date;
//
//   // print(request.fields);
//
//   var response = await request.send();
//
//   var responsed = await http.Response.fromStream(response);
//
//   print(response.statusCode);
//
//   if (response.statusCode == 200) {
//     var list = json.decode(responsed.body);
//
//     print(list['id']);
//
//     // List<noteModel> datasheet = list.map((f) => noteModel.fromJson(f)).toList();
//     // print('list ${datasheet[0]}');
//     list['id'] != null ?
//     Get.to(() => SingleNoteScreen(),
//         transition: Transition.rightToLeft,
//         arguments: [
//
//
//
//           list['title'],
//           list['description'],
//           list['emoji'],
//           list['created_at'].substring(0, 10),
//           list['profile_photo_url'],
//           list['created_at'].substring(11, 16)
//         ]) : null;
//
//     // return Future<List<noteModel>>.value(list);
//   } else {
//     throw Exception('Failed.');
//   }
// }

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/model/mini_courses_model.dart';
import 'package:InspireApp/model/note_model.dart';
import 'package:InspireApp/screens/auth/authorization_screen2.dart';
import 'package:InspireApp/screens/calendar/single_note/single_note_screen.dart';

GetStorage auth = GetStorage();

Future singleNoteRequest(date) async {
  String domain = Const.domain + 'api/user/note/date';
  Map<String, String> headers = {
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}',
    'Content-Type': 'application/json'
  };

  final response = await http.post(
    Uri.parse(domain),
    headers: headers,
    body: jsonEncode(<String, String>{
      'date': date,
    }),
  );

  if (response.statusCode == 200) {
    var jsonResponse = json.decode(response.body);
    // print(jsonResponse);
    // var data =  jsonResponse.map((jsonResponse) =>  noteModel.fromJson(jsonResponse)).toList();
    // print(data);
    print(noteModel.fromJson(jsonResponse));
    return noteModel.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load Categories from API');
  }
}
