import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:inspire/constants/bottom_app_bar.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/controllers/success_controller.dart';
import 'package:inspire/requests/profile/profile.dart';
import 'package:inspire/screens/registration/reg_screen_two.dart';
import 'package:oktoast/oktoast.dart';

GetStorage auth = GetStorage();

NoteStatusController noteStatusController = Get.put(NoteStatusController());

Future<void> createNoteRequest(description, emoji, File? photo,) async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${auth.read('token').toString()}'
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
  // print(responsed.body);

  Get.defaultDialog(
    title: 'Ваша заметка успешно сохранена!',
    titleStyle: GoogleFonts.poppins(),
    content: Text(
      'Проведите этот день с пользой!',
      style: GoogleFonts.poppins(),
    ),
    confirm: TextButton(onPressed: (){
      Get.back();
      Get.back();
    }, child: Text('Продолжить'),),
  );

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
