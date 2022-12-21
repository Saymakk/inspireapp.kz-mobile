import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/model/affirmation_model.dart';
import 'package:InspireApp/model/cities_model.dart';
import 'package:InspireApp/model/meditation_model.dart';
import 'package:InspireApp/model/mini_courses_model.dart';

// Future<List<citiesListModel>> citiesListRequest() async {
Future<List> citiesListRequest() async {
  GetStorage auth = GetStorage();

  var headers = {'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'};

  final Uri url = Uri.parse(Const.domain + 'api/cities');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);
  print(json.decode(responsed.body));

  List<dynamic> cities = json.decode(responsed.body);

  Hive.box('db').put('list', cities);
  return cities;

  // if (response.statusCode == 200) {
  //   Iterable list = json.decode(responsed.body);
  //   List<citiesListModel> datasheet =
  //       list.map((f) => citiesListModel.fromJson(f)).toList();
  //
  //   return Future<List<citiesListModel>>.value(datasheet);
  // } else {
  //   throw Exception('Failed.');
  // }
}
