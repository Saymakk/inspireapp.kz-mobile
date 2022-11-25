import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:InspireApp/constants/bottom_app_bar.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/screens/auth/authorization_screen.dart';

class RegisterAgreed extends StatelessWidget {
  const RegisterAgreed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 66),
        child: Center(
          child: Column(
            children: [
              Text(
                'Вы успешно зарегистрированы!',
                style: Const.black27boldC,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  // child: Text(
                  //   'Вы получите уведомление, когда мы откроем для вас доступ к прилоложению',
                  //   style: Const.black14,
                  //   textAlign: TextAlign.center,
                  // ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.offAll(()=>BottomNav());
                  // Get.off(() => AuthorizationScreen(),
                  //     transition: Transition.rightToLeft);
                },
                child: Container(
                  width: double.infinity,
                  height: 40,
                  decoration: Const.cont_turq_circ8,
                  // padding: EdgeInsets.only(top: 5),
                  margin: EdgeInsets.only(
                    bottom: 70,
                    top: 15,
                  ),
                  child: Center(
                    child: Text(
                      'Хорошо',
                      style: Const.buttontextstyle,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
