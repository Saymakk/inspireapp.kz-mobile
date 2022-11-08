import 'package:get/get.dart';

class NoteStatusController extends GetxController {
  static NoteStatusController get to => Get.find();

  var count = 0.obs;
  increment() => count++;

  // @override
  // void onClose() => noteStatus.value;
  //
  // void currentNoteValue(String value) => noteStatus.value;
}
