import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/model/affirmation_model.dart';
import 'package:InspireApp/model/meditation_model.dart';
import 'package:InspireApp/model/single_affirm.dart';

Future<List<meditationsList>> meditationsCatRequest(id) async {
  GetStorage auth = GetStorage();

  print(id);

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };

  final Uri url = Uri.parse(Const.domain + 'api/meditations/categories/$id');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body)[0]['contents'];
    List<meditationsList> datasheet =
        list.map((f) => meditationsList.fromJson(f)).toList();

    // print(list.toString());

    return Future<List<meditationsList>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}
