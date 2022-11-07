import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/screens/affirmation_screen/single_affirm/single_aff.dart';
import 'package:inspire/screens/meditation_screen/player/player_screen.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ThanksScreen extends StatefulWidget {
  const ThanksScreen({Key? key}) : super(key: key);

  @override
  State<ThanksScreen> createState() => _TanksScreenState();
}

class _TanksScreenState extends State<ThanksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        toolbarHeight: 80,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        titleSpacing: 0,
        title: Container(
          padding: EdgeInsets.only(top: 15),
          child: Text(
            'Ментальная установка «Благодарность»',
            maxLines: 3,
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 20),
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.only(
          top: 28,
          left: 22,
          right: 22,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                    color: Color(0xffE3F8FF),
                    borderRadius: BorderRadius.circular(19)),
                child: Container(
                  margin: EdgeInsets.all(22),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Ваш прогресс'),
                      SizedBox(
                        height: 24,
                      ),
                      Center(
                        child: LinearPercentIndicator(
                          padding: EdgeInsets.all(0),
                          // width: MediaQuery.of(context).size.width/1.1,
                          lineHeight: 5.0,
                          percent: 0.2,
                          barRadius: Radius.circular(15),
                          backgroundColor: Colors.white,
                          progressColor: Color(0xff21cac8),
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1'),
                          Text('2'),
                          Text('3'),
                          Text('4'),
                          Text('5'),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 50),
                padding: EdgeInsets.only(
                    left: 19, right: 19, top: 13.5, bottom: 10.5),
                decoration: BoxDecoration(
                  color: Color(0xffFFFEE3),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListTile(
                  leading: Image.asset(
                    Const.icns + '!.png',
                    color: Color(0xffFFDD65),
                    height: 37,
                  ),
                  title: Text(
                    'Создай вокруг себя тишину. Я буду произносить аффирмации. Громко и четко повторяй за мной. Если не получится, попробуй еще раз.',
                    maxLines: 10,
                    style: GoogleFonts.poppins(
                        fontSize: 13, color: Color(0xff7B7767), height: 1.3),
                  ),
                ),
              ),
              Text(
                'Разреши доступ:',
                style: GoogleFonts.poppins(
                    fontSize: 13,
                    color: Color(0xff282828),
                    height: 1.3,
                    fontWeight: FontWeight.w600),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff7fafb),
                  borderRadius: BorderRadius.circular(15)
                ),
                margin: EdgeInsets.only(top: 12),
                child: Container(
                  margin: EdgeInsets.only(left: 17, top: 17, bottom: 17),
                  child: Row(
                    /** Иконка и текст **/
                    children: [
                      SvgPicture.asset(Const.icns + 'mic.svg', width: 40, height: 40,),
                      SizedBox(width: 23,),
                      Text('Микрофон',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xff4F4F4F),
                            height: 1.3,
                            fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xfff7fafb),
                  borderRadius: BorderRadius.circular(15)
                ),
                margin: EdgeInsets.only(top: 12, bottom: 80),
                child: Container(
                  margin: EdgeInsets.only(left: 17, top: 17, bottom: 17),
                  child: Row(
                    /** Иконка и текст **/
                    children: [
                      SvgPicture.asset(Const.icns + 'chat.svg', width: 40, height: 40,),
                      SizedBox(width: 23,),
                      Text('Распознование речи',
                        style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Color(0xff4F4F4F),
                            height: 1.3,
                            fontWeight: FontWeight.w600),),
                    ],
                  ),
                ),
              ),
              /** Запрос на разрешение пользоваться микрофоном.
               *  После разрешения сменить цвет кнопки на бирюзовый **/
              GestureDetector(
                onTap: ()=>Get.to(()=>SingleAffScreen()),
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(color: Color(0xffd6d6d6), borderRadius: BorderRadius.circular(8)),
                  child: Center(child: Text('Далее',
                    style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white,
                        height: 1.3,
                        fontWeight: FontWeight.bold),),),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
