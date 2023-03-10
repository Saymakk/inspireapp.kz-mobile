import 'dart:convert';
import 'dart:io';

// import 'package:dio/dio.dart';
import 'package:InspireApp/requests/profile/profile_init.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:InspireApp/widgets/bottom_app_bar.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/profile/profile.dart';
import 'package:InspireApp/screens/ProfileScreen/profile_screen.dart';
import 'package:InspireApp/screens/registration/reg_screen_two.dart';
import 'package:oktoast/oktoast.dart';

GetStorage auth = GetStorage();

Future<void> userUpdateRequest(
  String name,
  String lastName,
  int city,
  String description,
  image,
) async {
  // print('Длина ${image}');

  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };
  print(Hive.box('mybox').get(0));

  final Uri url = await Uri.parse(Const.domain + 'api/user/update');
  var request = await http.MultipartRequest('POST', url);

  request.headers.addAll(headers);

  if (description.length == 0) {
    description = '';
  } else {
    description = description;
  }
  print(description.length);

  if (image == null) {
    request.fields['name'] = name;
    request.fields['last_name'] = lastName;
    if (description.length < 1) {
      null;
    } else {
      request.fields['description'] = description;
    }
    // request.fields['description'] = description;
    request.fields['city_id'] = city.toString();
  } else {
    request.fields['name'] = name;
    request.fields['last_name'] = lastName;
    if (description.length < 1) {
      null;
    } else {
      request.fields['description'] = description;
    }
    request.fields['city_id'] = city.toString();

    request.files.add(
      await http.MultipartFile.fromPath("photo", image.path.toString()),
    );
  }

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  if (response.statusCode == 200) {
    // var data = json.decode(responsed.body);

    await profileRequestInit();

    return Get.defaultDialog(
      title: 'Сохранить изменения',
      content: Text('Вы внесли изменения в свой аккаунт.'),
      confirm: TextButton(
          onPressed: () async {
            await userActivitiesInit();
            await profileRequestInit();
            Get.back();
            Get.back();
          },
          child: Text('Продолжить')),
    );
  } else {
    print('Какая-то ошибка');
  }
}
