import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/model/single_affirm.dart';


Future<List<categoriesAff>> affirmationsRequestWithOffset() async {
  GetStorage auth = GetStorage();

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };

  final Uri url = Uri.parse(Const.domain + 'api/affirmations?paginate=3&page=1');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);
  // print(responsed.body);


  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body)['data'];

    // print(list);

    List<categoriesAff> datasheet =
    list.map((f) => categoriesAff.fromJson(f)).toList();

    // print(list.toString());

    return Future<List<categoriesAff>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}
