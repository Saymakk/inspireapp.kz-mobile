import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:inspire/model/meditPaginated.dart';
import 'package:inspire/model/meditation_model.dart';

Future<List<meditationsListPag>> meditationsRequestWithOffset() async {

  GetStorage auth = GetStorage();

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${auth.read('token').toString()}'
  };

  final Uri url = Uri.parse('https://inspireapp.kz/api/meditations?paginate=3&page=1');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  // print(responsed.body);
  print(response.statusCode);

  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body);

    print(responsed.body);

    List<meditationsListPag> datasheet = list.map((f) => meditationsListPag.fromJson(f)).toList();



    return Future<List<meditationsListPag>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}