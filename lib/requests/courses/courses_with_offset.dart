import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:inspire/model/affirmation_model.dart';
import 'package:inspire/model/meditation_model.dart';
import 'package:inspire/model/mini_courses_model.dart';

Future<List<coursesList>> coursesRequestWithOffset() async {

  GetStorage auth = GetStorage();

  var headers = {
    'Authorization': 'Bearer ${auth.read('token').toString()}'
  };

  final Uri url = Uri.parse('https://kz.inspireapp.kz/api/courses?paginate=3&page=1');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  // print(response.statusCode);

  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body)['data'];
    List<coursesList> datasheet = list.map((f) => coursesList.fromJson(f)).toList();

    // print(list);

    return Future<List<coursesList>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}