import 'dart:convert';
import 'package:InspireApp/model/meditation_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:InspireApp/constants/constants.dart';

GetStorage auth = GetStorage();

String medlen = '';

Future<List<meditationsList>> likedMedit() async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };

  final Uri url = await Uri.parse(Const.domain + 'api/liked/meditation');
  var request = await http.MultipartRequest('GET', url);
  print(Const.domain);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body);
    List<meditationsList> datasheet =
        list.map((f) => meditationsList.fromJson(f)).toList();

    print(list == [] ? 'null' : 'notnull');
    print(datasheet.length);
    Hive.box('db').put('meditliked', datasheet.length);

     medlen = datasheet.length.toString(); //вот это значение надо записать

    return Future<List<meditationsList>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}
