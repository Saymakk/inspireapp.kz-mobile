import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/model/affirmation_model.dart';
import 'package:InspireApp/model/invited_users.dart';
import 'package:InspireApp/model/meditation_model.dart';

Future<List<invitedUsersModel>> invitedUsersRequest() async {
  GetStorage auth = GetStorage();

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };

  final Uri url = Uri.parse(Const.domain + 'api/invited_users');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);


  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body);


    List<invitedUsersModel> datasheet =
    list.map((f) => invitedUsersModel.fromJson(f)).toList();


    return Future<List<invitedUsersModel>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}
