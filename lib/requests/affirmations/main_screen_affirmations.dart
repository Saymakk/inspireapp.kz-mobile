import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:inspire/model/affirmation_model.dart';
import 'package:inspire/model/meditation_model.dart';

Future<List<affirmationsList>> affirmationsRequest() async {
  GetStorage auth = GetStorage();

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${auth.read('token').toString()}'
  };

  final Uri url = Uri.parse('https://inspireapp.kz/api/affirmations');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body);
    List<affirmationsList> datasheet =
        list.map((f) => affirmationsList.fromJson(f)).toList();

    // print(datasheet);

    return Future<List<affirmationsList>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}
