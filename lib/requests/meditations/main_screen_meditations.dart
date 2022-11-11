import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/model/meditation_model.dart';

Future<List<meditationsList>> meditationsRequest() async {

  GetStorage auth = GetStorage();

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${auth.read('token').toString()}'
  };

  final Uri url = Uri.parse(Const.domain + 'api/meditations');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);


  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body);
    List<meditationsList> datasheet = list.map((f) => meditationsList.fromJson(f)).toList();

    // print(list.toString());

    return Future<List<meditationsList>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}