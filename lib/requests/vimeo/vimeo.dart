import 'dart:convert';

import 'package:InspireApp/screens/courses/single_course/web_view_page.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/screens/ProfileScreen/profile_screen.dart';

Future<void> vimeoRequest(String video_id) async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Const.vimeo_token}'
  };

  final Uri url = await Uri.parse(Const.vimeo + video_id);
  var request = await http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    var data = await json.decode(responsed.body);

    print('response.statusCode : ${response.statusCode}');

    // print('data : ${data}');
    // print('data : ${data['player_embed_url']}');

    Get.to(
      () => webViewPage(), transition: Transition.rightToLeft,
      arguments: [
        data['player_embed_url'],
      ],
    );
  } else {
    print('error');
  }
}
