import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/model/meditation_model.dart';

Future<List<meditationsList>> meditationsRequestWithOffset() async {
  GetStorage auth = GetStorage();

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };

  final Uri url = Uri.parse(
    Const.domain + 'api/meditations/categories?paginate=3&page=1',
  );

  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  // print(responsed.body);


  if (response.statusCode == 200) {


    // print(json.decode(responsed.body));

    Iterable list = json.decode(responsed.body)['data'];

    // print(list);

    List<meditationsList> datasheet =
        list.map((f) => meditationsList.fromJson(f)).toList();

    // print(datasheet);

    return Future<List<meditationsList>>.value(datasheet);
  } else {


    throw Exception('Failed.');
  }
}
