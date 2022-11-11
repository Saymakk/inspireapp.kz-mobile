import 'dart:convert';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:inspire/model/affirmation_model.dart';
import 'package:inspire/model/meditation_model.dart';
import 'package:inspire/model/mini_courses_model.dart';
import 'package:inspire/screens/courses/single_course/single_course.dart';

var id;

Future<void> singleCourse(id) async {
  GetStorage auth = GetStorage();

  var headers = {'Authorization': 'Bearer ${auth.read('token').toString()}'};

  final Uri url = Uri.parse('https://kz.inspireapp.kz/api/courses/$id');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    dynamic list = json.decode(responsed.body);

    print(list['course_contents'][0]['title']);

    // List<coursesList> datasheet = list.map((f) => coursesList.fromJson(f)).toList();

    Get.to(() => SingleCourseScreen(),
        transition: Transition.rightToLeft, arguments: [
          list['course_contents'][0]['title'],
          list['course_contents'][0]['material_path'],
          list['course_contents'][0]['length'],
          list['course_contents'][0]['description'],

        ]);
    // return Future<List<coursesList>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}
