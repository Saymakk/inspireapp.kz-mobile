import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:get_storage/get_storage.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/event_provider/event_provider.dart';

import 'package:inspire/model/mini_courses_model.dart';
import 'package:inspire/model/note_model.dart';
import 'package:provider/provider.dart';

Future<List<noteModel>> calendarScreenRequest() async {

  GetStorage auth = GetStorage();
  GetStorage calendar = GetStorage();

  var headers = {
    'Authorization': 'Bearer ${auth.read('token').toString()}'
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