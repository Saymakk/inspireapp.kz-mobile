import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/model/affirmation_model.dart';
import 'package:inspire/model/meditation_model.dart';
import 'package:inspire/model/single_affirm.dart';

Future<List<categoriesAff>> affirmationsRequest() async {
  GetStorage auth = GetStorage();

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${auth.read('token').toString()}'
  };

  final Uri url = Uri.parse(Const.domain + 'api/affirmations');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body);
    List<categoriesAff> datasheet =
        list.map((f) => categoriesAff.fromJson(f)).toList();

    // print(list.toString());

    return Future<List<categoriesAff>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}
