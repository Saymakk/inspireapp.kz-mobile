import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:inspire/constants/constants.dart';
import 'package:inspire/screens/registration/registering_screen.dart';
import 'package:inspire/screens/registration/reg_screen_one.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  int mCurrentIndex = -1;

  PageController _controller = new PageController();

  List<Widget> pages = [DescrOne(), DescrTwo(), DescrThree(), DescrFour()];

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  var activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Const.greybg,
        child: Scaffold(
            body: Padding(
          padding: const EdgeInsets.only(top: 85),
          child: Center(
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      SvgPicture.asset(Const.imgs + 'logo.svg'),
                      TextLogo(),

                      // PageView.builder(itemBuilder: itemBuilder)

                      Container(
                        width: double.infinity,
                        child: CarouselSlider.builder(
                          itemCount: 4,
                          itemBuilder: (context, index, realIndex) {
                            final indexPage = pages[index];
                            if (activeIndex == 0) {
                              return DescrOne();
                            } else {
                              if (activeIndex == 1) {
                                return DescrTwo();
                              } else {
                                if (activeIndex == 2) {
                                  return DescrThree();
                                } else {
                                  return DescrFour();
                                }
                              }
                            }
                          },
                          options: CarouselOptions(
                            autoPlayCurve: Curves.easeOut,
                            viewportFraction: 1,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            // enlargeStrategy: CenterPageEnlargeStrategy.height,
                            autoPlayInterval: const Duration(seconds: 3),
                            onPageChanged: (index, reason) {
                              setState(() {
                                activeIndex = index++;
                                if (activeIndex == 4) {
                                  setState(() {
                                    activeIndex = 0;
                                  });
                                }
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Dots(),
                    StartButton(),
                  ],
                ),
              ],
            ),
          ),
        )));
  }

  Widget TextLogo() {
    return Padding(
      padding: const EdgeInsets.only(top: 21, bottom: 47),
      child: Container(
        width: 272.62,
        child: Text(
          'Добро пожаловать в проект INSPIRE',
          style: Const.black27bold,
          textAlign: TextAlign.center,
          maxLines: 3,
        ),
      ),
    );
  }

  Widget Dots() {
    return DotsIndicator(
      dotsCount: pages.length,
      position: activeIndex.toDouble(),
      decorator: DotsDecorator(
        size: Size(7, 7),
        activeSize: Size(7, 7),
        color: Const.greyinactive, // Inactive color
        activeColor: Const.turq,
      ),
    );
  }

  Widget StartButton() {
    return GestureDetector(
      onTap: () {
        // Get.to(() => RegisteringScreen(), transition: Transition.rightToLeft);
        Get.to(() => RegScreenOne(), transition: Transition.rightToLeft);
      },
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: Const.cont_turq_circ8,
        // padding: EdgeInsets.only(top: 5),
        margin: EdgeInsets.only(left: 24, right: 24, top: 22, bottom: 66),
        child: Center(
          child: Text(
            'Начать',
            style: Const.buttontextstyle,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class DescrOne extends StatefulWidget {
  const DescrOne({Key? key}) : super(key: key);

  @override
  State<DescrOne> createState() => _DescrOneState();
}

class _DescrOneState extends State<DescrOne> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'Ежедневные медитации созданы для трансформации человека день за днем',
        style: Const.black14,
        textAlign: TextAlign.center,
        maxLines: 3,
      ),
    );
  }
}

class DescrTwo extends StatefulWidget {
  const DescrTwo({Key? key}) : super(key: key);

  @override
  State<DescrTwo> createState() => _DescrTwoState();
}

class _DescrTwoState extends State<DescrTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'Медитация — это инструмент духовных учений буддизма, который помогает очистить сознание и научиться управлять им.',
        style: Const.black14,
        textAlign: TextAlign.center,
        maxLines: 3,
      ),
    );
  }
}

class DescrThree extends StatefulWidget {
  const DescrThree({Key? key}) : super(key: key);

  @override
  State<DescrThree> createState() => _DescrThreeState();
}

class _DescrThreeState extends State<DescrThree> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'Медитация позволяет достичь внутреннего состояния спокойствия ума и тела при полной осознанности и внимательности',
        style: Const.black14,
        textAlign: TextAlign.center,
        maxLines: 3,
      ),
    );
  }
}

class DescrFour extends StatefulWidget {
  const DescrFour({Key? key}) : super(key: key);

  @override
  State<DescrFour> createState() => _DescrFourState();
}

class _DescrFourState extends State<DescrFour> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      child: Text(
        'Для тех, кто ведёт активный образ жизни, практики могут стать ресурсом физического и эмоционального восстановления.',
        style: Const.black14,
        textAlign: TextAlign.center,
        maxLines: 3,
      ),
    );
  }
}
