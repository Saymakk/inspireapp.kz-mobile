import 'dart:convert';

import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/model/affirmation_model.dart';
import 'package:inspire/model/meditation_model.dart';
import 'package:inspire/model/mini_courses_model.dart';
import 'package:inspire/screens/courses/single_course/single_course.dart';


Future<void> singleCourse(id) async {
  GetStorage auth = GetStorage();

  var headers = {'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'};

  final Uri url = Uri.parse(Const.domain + 'api/courses/1/content/$id');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    dynamic list = json.decode(responsed.body);

    print(list['path']);

    // List<coursesList> datasheet = list.map((f) => coursesList.fromJson(f)).toList();

    Get.to(() => SingleCourseScreen(),
        transition: Transition.rightToLeft, arguments: [
          list['title'],
          list['material_path'],
          list['length'],
          list['description'],
          list['path'],
          list['picture'],

        ]);
    // return Future<List<coursesList>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}
