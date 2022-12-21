import 'dart:convert';

// import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/screens/ProfileScreen/profile_screen.dart';
import 'package:InspireApp/screens/auth/authorization_screen2.dart';
import 'package:InspireApp/screens/registration/reg_screen_two.dart';
import 'package:oktoast/oktoast.dart';
import 'package:translit/translit.dart';

GetStorage auth = GetStorage();
GetStorage user = GetStorage();

Future<void> profileRequest() async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };

  final Uri url = await Uri.parse(Const.domain + 'api/user');
  var request = await http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    var data = await json.decode(responsed.body);

    print('response.statusCode : ${response.statusCode}');
    print('data : ${data}');

    await user.write('username', data);
    await Hive.box('mybox').put('UserData', data);
    await Hive.box('mybox').put('name', data['name']);
    await Hive.box('mybox').put('last_name', data['last_name']);
    await Hive.box('mybox').put('description', data['description']);
    await Hive.box('mybox').put('city_id', data['city_id']);
    await Hive.box('mybox').put('photo', data['profile_photo_url']);

    var avatar = 'https://ui-avatars.com/';
    print(Hive.box('mybox').get('photo').substring(0, 23).toString() +
        ' ЗДЕСЬ ФОТО');
    if (avatar == Hive.box('mybox').get('photo').substring(0, 23).toString()) {
      print('Фото из генератора');
      await Hive.box('mybox').put('photo',
          'https://ui-avatars.com/api/?name=${Translit().toTranslit(source: Hive.box('mybox').get('name').substring(0, 1))}&color=7F9CF5&background=EBF4FF');
    } else {
      print('Фото не из генератора');
    }

    Get.to(() => ProfileScreen(),
        transition: Transition.rightToLeft,
        arguments: [
          data['code'],
          data['full_name'],
          data['description'],
          data['phone'],
          data['profile_photo_url']
        ]);
  } else {
    print('error');
  }
}

Future<void> userActivities() async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };

  final Uri url =
      await Uri.parse('https://kz.inspireapp.kz/api/user_activities');
  var request = await http.MultipartRequest('GET', url);
  request.headers.addAll(headers);

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);

  if (response.statusCode == 200) {
    var data = await json.decode(responsed.body);

    user.write('meditation', data['meditation'].toString());
    user.write('affirmations', data['affirmations'].toString());
    user.write('courses', data['courses'].toString());
    user.write('invited_users', data['invited_users'].toString());

    //
    // Get.to(() => ProfileScreen(),
    //     transition: Transition.rightToLeft,
    //     arguments: [
    //       data['code'],
    //       data['full_name'],
    //       data['description'],
    //       data['phone'],
    //       data['profile_photo_url']
    //     ]);
  } else {
    print('error');
  }
}
