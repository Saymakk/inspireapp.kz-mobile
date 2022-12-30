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

List<String> citiess = [];

Future<void> citiesListRequest() async {
  GetStorage auth = GetStorage();

  citiess.clear();

  var headers = {'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'};

  final Uri url = Uri.parse(Const.domain + 'api/cities');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);
  print(json.decode(responsed.body));

  dynamic cities = json.decode(responsed.body);


  for (dynamic i = 0; i < cities.length; i++) {
    print(cities[i]['title']);
    citiess.add(cities[i]['title']);
  }
  print(citiess.toString());

  Hive.box('db').put('list', cities);
  Hive.box('db').put('cities', citiess);

  print('города ' + Hive.box('db').get('list').toString());
  print('города2 ' + Hive.box('db').get('cities').toString());



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
