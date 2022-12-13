import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'dart:math' as math;

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:dio/dio.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:InspireApp/constants/constants.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

import 'affirm_end.dart';

class SingleAffScreen extends StatefulWidget {
  const SingleAffScreen({Key? key}) : super(key: key);

  @override
  State<SingleAffScreen> createState() => _SingleAffScreenState();
}

class _SingleAffScreenState extends State<SingleAffScreen>
    with SingleTickerProviderStateMixin {
  bool isFile = false;

  // bool playerButton = false;
  var hive_aff = Hive.box('db');

  String title = Get.arguments[0];
  int len = Get.arguments[1];
  int aff_id = Get.arguments[2];
  String aff_path = Get.arguments[3];

  late final AnimationController _controller =
      AnimationController(vsync: this, duration: Duration(seconds: 1))
        ..repeat();

  // String aff_desc = Get.arguments[4];
  final audioPlayer = AudioPlayer();

  bool active = false;

  GetStorage local_audio = GetStorage();

  void activePress() {
    setState(() {
      active = true;
    });
    print(active);
    // audioPlayer.play(AssetSource('audio/sound1.wav'));
    audioPlayer.play(DeviceFileSource(hive_aff.get('aff_${aff_id}')));
    print(len);
  }

  void inactivePress() {
    setState(() {
      active = false;
    });
    print(active);
    audioPlayer.stop();
  }

  @override
  initState() {
    // TODO: implement initState
    super.initState();

    print(hive_aff.get('aff_${aff_path}'));
    print(hive_aff.get('aff_${aff_path}').runtimeType);

    // downloadFile();

    var counter = len;

    // active == true ?  audioPlayer.play(AssetSource('audio/sound1.wav')) : audioPlayer.stop();
    active == true
        // ? audioPlayer.play(UrlSource(Const.domain + aff_path))
        ? audioPlayer.play(DeviceFileSource(hive_aff.get('aff_${aff_id}')))
        : audioPlayer.stop();

    // Timer.periodic(const Duration(seconds: 1), (timer) async {
    //   // print(timer.tick);
    //   if (active == true) {
    //     counter--;
    //     print(counter);
    //     if (counter == 0) {
    //       /** Разобраться с таймером **/
    //       setState(() {
    //         print('Cancel timer');
    //         timer.cancel();
    //
    //         Get.off(
    //           () => CongratAffirm(),
    //           arguments: [aff_id],
    //         );
    //       });
    //     }
    //   } else {
    //     if (active == false) {
    //       setState(() {
    //         counter = len;
    //         timer.cancel();
    //       });
    //     }
    //   }
    // });
    hive_aff.get('aff_${aff_id}') != null ? isFile = true : isFile = false;
  }

  static const colorizeColors = [
    Color(0xff21cac8),
    Colors.white,
  ];

  @override
  dispose() {
    audioPlayer.dispose();

    _controller.dispose(); // you need this
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('путь файлы ' + aff_path.toString());

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
              },
              icon: Icon(Icons.arrow_back)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
        extendBodyBehindAppBar: true,
        // extendBody: true,
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Container(
            padding: EdgeInsets.only(left: 24, right: 24, top: 70),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Visibility(
                    visible: active,
                    child:
                  Expanded(
                    child: Container(
                      child: AnimatedTextKit(
isRepeatingAnimation: false,
                        pause: Duration(seconds: 0),
                        displayFullTextOnTap: true,
                        totalRepeatCount: 1,
                        stopPauseOnTap: active,
                        onFinished: () {
                          audioPlayer.stop();
                          Get.to(
                                () => CongratAffirm(),
                            arguments: [aff_id],
                          );
                        },
                        animatedTexts: [
                          ColorizeAnimatedText(
                            '$title',
                            textStyle: GoogleFonts.poppins(
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20,
                            ),
                            textAlign: TextAlign.center,
                            colors: colorizeColors,
                            speed: Duration(
                              milliseconds: active == true ? 30 : 0,
                            ),
                            // cursor: '',
                          ),
                        ],
                      ),
                    ),
                  ),
                  ),
                  Visibility(
                    visible: !active,
                    child: Expanded(
                      child: Text(
                        '$title',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Visibility(
                      visible: isFile,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(
                            bottom: 70,
                          ),
                          child: Stack(
                            children: [
                              AnimatedBuilder(
                                animation: _controller,
                                builder: (_, child) {
                                  return Transform.rotate(
                                    angle: active == true
                                        ? (_controller.value * 2 * math.pi)
                                        : 0,
                                    child: child,
                                  );
                                },
                                child: DottedBorder(
                                  dashPattern: [100, 65],
                                  color: Colors.white,
                                  strokeWidth: 2,
                                  borderType: BorderType.Circle,
                                  child: Container(
                                    margin: EdgeInsets.all(70),
                                    child: SizedBox(
                                      width: 74,
                                      height: 74,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.all(70),
                                child: GestureDetector(
                                  // onTap: () {
                                  //   setState(() {
                                  //     active = !active;
                                  //   });
                                  // },
                                  // onTapDown: (_) => activePress(),
                                  onTapDown: (_) => activePress(),
                                  // onTapDown: (_) => Get.to(()=>CongratAffirm(),
                                  //   arguments: [aff_id],),

                                  onTapUp: (_) => inactivePress(),

                                  child: SvgPicture.asset(
                                    Const.icns + 'finger.svg',
                                    color: active == true
                                        ? Color(0xff21cac8)
                                        : Colors.white,
                                    height: 74,
                                    width: 74,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !isFile,
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: GestureDetector(
                        child: Container(
                          margin: EdgeInsets.only(bottom: 50),
                          child: IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('Ваша аффирмация скачивается!'),
                                ),
                              );
                              print(hive_aff.get('aff_$aff_id'));

                              downloadFile();

                              // setState(() {
                              //   isFile = !isFile;
                              // });
                            },
                            icon: Icon(
                              Icons.download,
                              color: Colors.white,
                              size: 40,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<File?> downloadFile() async {
    final appStorage = await getApplicationDocumentsDirectory();
    final file = File('${appStorage.path}/aff_${aff_id}');
    final response = await Dio().get(Const.domain + aff_path,
        options: Options(
          responseType: ResponseType.bytes,
          followRedirects: false,
          receiveTimeout: 0,
        ));

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    print(file.path);
    if (file.path != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Ваша аффирмация загрузилась!'),
        ),
      );
      setState(() {
        isFile = true;
      });
    } else {
      setState(() {
        isFile = false;
      });
    }
    ;

    await local_audio.write('audio_$aff_id', file.path);
    await hive_aff.put('aff_$aff_id', '${appStorage.path}/aff_${aff_id}');
    return file;
  }
}
