import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:InspireApp/widgets/bottom_app_bar.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/controllers/success_controller.dart';
import 'package:InspireApp/requests/profile/profile.dart';
import 'package:InspireApp/screens/registration/reg_screen_two.dart';
import 'package:oktoast/oktoast.dart';

GetStorage auth = GetStorage();

NoteStatusController noteStatusController = Get.put(NoteStatusController());

Future<void> createNoteRequest(description, emoji, File? photo,) async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${Hive.box('mybox').get(0)}'
  };

  final Uri url = await Uri.parse(Const.domain + 'api/user/note/create');
  var request = await http.MultipartRequest('POST', url);

  request.headers.addAll(headers);

  request.fields['title'] = 'Моё настроение сегодня';
  request.fields['description'] = description;
  request.fields['emoji'] = emoji;
  request.files.add(await http.MultipartFile.fromPath("photo", photo!.path,),);

  var response = await request.send();

  var responsed = await http.Response.fromStream(response);

  print(response.statusCode);
  print(request.fields);
  print(photo!.path);
  print(headers);
  print(responsed.body);
  print(response.statusCode);
  // print(responsed.body);
if(response.statusCode == 200) {
    Get.defaultDialog(
      title: 'Ваша заметка успешно сохранена!',
      titleStyle: GoogleFonts.poppins(),
      content: Text(
        'Проведите этот день с пользой!',
        style: GoogleFonts.poppins(),
      ),
      confirm: TextButton(
        onPressed: () {
          Get.back();
          Get.back();
        },
        child: Text('Продолжить'),
      ),
    );
  } else {
  OKToast(child: Text('Что-то пошло не так! Попробуйте снова.'),);

}

  // noteStatusController.currentNoteValue('asdasd');

  // print(noteStatusController.noteStatus.value);

  // responsed.body == 'success' ? print('SUCCESS') : print('NE SUCCESS');

  // if (response.statusCode == 200) {
  //   var data = json.decode(responsed.body);

  // return Get.back();
  // } else {
  //   print('text');
  // }
}
