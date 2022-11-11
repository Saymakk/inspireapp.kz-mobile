import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:inspire/constants/constants.dart';

class CongratAffirm extends StatelessWidget {
  const CongratAffirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Const.imgs + 'player_bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Get.back();
                Get.back();
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.close)),
          ],
        ),
        extendBodyBehindAppBar: true,
        // extendBody: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 24, right: 24, top: 70),
            child: Center(
            ),
          ),
        ),
      ),
    );
  }
}
