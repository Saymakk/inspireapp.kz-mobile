import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/model/affirmation_model.dart';
import 'package:inspire/model/cities_model.dart';
import 'package:inspire/model/meditation_model.dart';
import 'package:inspire/model/mini_courses_model.dart';

Future<List<citiesListModel>> citiesListRequest() async {

  GetStorage auth = GetStorage();

  var headers = {
    'Authorization': 'Bearer ${auth.read('token').toString()}'
  };

  final Uri url = Uri.parse(Const.domain + 'api/cities');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  // print(response.statusCode);

  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body);
    List<citiesListModel> datasheet = list.map((f) => citiesListModel.fromJson(f)).toList();

    // print(list);

    return Future<List<citiesListModel>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}