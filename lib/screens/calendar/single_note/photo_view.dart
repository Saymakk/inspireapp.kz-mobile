import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class photo_view extends StatelessWidget {
  photo_view({Key? key}) : super(key: key);

  var photo = Get.arguments[0];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white,
      extendBody: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Get.back(),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff282828),
            )),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        // width: double.infinity, height: double.infinity,
        // color: Colors.white,
        child: PhotoView(
          backgroundDecoration: BoxDecoration(color: Colors.white),
          imageProvider: NetworkImage(photo),
        ),
      ),
    );
  }
}
