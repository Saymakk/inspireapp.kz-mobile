import 'dart:convert';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/event_provider/event_provider.dart';

import 'package:InspireApp/model/mini_courses_model.dart';
import 'package:InspireApp/model/note_model.dart';
import 'package:provider/provider.dart';

Future<List<noteModel>> calendarNotesRequest() async {

  GetStorage auth = GetStorage();
  GetStorage calendar = GetStorage();

  var headers = {
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };

  final Uri url = Uri.parse(Const.domain + 'api/user/note');
  var request = http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();
  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    Iterable list = json.decode(responsed.body);
    List<noteModel> datasheet = list.map((f) => noteModel.fromJson(f)).toList();

    calendar.write('calendar', jsonEncode(list));

    // final provider = Provider.of<EventProvider>()
    // print(list.toString());

    return Future<List<noteModel>>.value(datasheet);
  } else {
    throw Exception('Failed.');
  }
}