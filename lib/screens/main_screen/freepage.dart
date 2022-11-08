import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspire/controllers/success_controller.dart';

class freepage extends StatelessWidget {
  freepage({Key? key}) : super(key: key);

  final noteStatusController = Get.put(NoteStatusController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {

            // print(noteStatusController.noteStatus);
          },
          child:
            Obx(() => Text(
                '${noteStatusController.count}',
                style: TextStyle(color: Colors.black),
            ),),
        ),
      ),
    );
  }
}
