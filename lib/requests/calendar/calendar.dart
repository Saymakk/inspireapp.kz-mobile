import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';

import 'package:inspire/model/mini_courses_model.dart';
import 'package:inspire/model/note_model.dart';

Future<List<noteModel>> calendarNotesRequest() async {

  GetStorage auth = GetStorage();

  var headers = {
    'Authorization': 'Bearer ${auth.read('token').toString()}'
  };

  final Uri url = Uri.parse('https://kz.inspireapp.kz/api/user/note');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body);
    List<noteModel> datasheet = list.map((f) => noteModel.fromJson(f)).toList();

    print(list.toString());

    return Future<List<noteModel>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}