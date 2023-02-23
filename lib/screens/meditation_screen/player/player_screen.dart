import 'dart:io';
import 'dart:ui';
import 'package:InspireApp/constants/constants.dart';
import 'package:InspireApp/requests/affirmations/affirm_done.dart';
import 'package:InspireApp/requests/affirmations/do_like.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

import 'package:audioplayers/audioplayers.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io' show Platform;

class PlayerScreen extends ConsumerStatefulWidget {
  const PlayerScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends ConsumerState<PlayerScreen> {
  GetStorage local_audio = GetStorage();
  var hive_medit = Hive.box('db');

  var audio_id = Get.arguments[0];
  var audio_title = Get.arguments[1];
  var audio_desc = Get.arguments[2];
  var audio_path = Get.arguments[3];
  var audio_length = Get.arguments[4].toString();

  final audioPlayer = AudioPlayer();

  final AudioContext audioContext = AudioContext(
    iOS: AudioContextIOS(
        defaultToSpeaker: false,
        category: AVAudioSessionCategory.playback,
        options: [AVAudioSessionOptions.mixWithOthers] +
            [AVAudioSessionOptions.allowAirPlay] +
            [AVAudioSessionOptions.allowBluetooth] +
            [AVAudioSessionOptions.allowBluetoothA2DP]),
    android: AudioContextAndroid(
      isSpeakerphoneOn: true,
      stayAwake: true,
      contentType: AndroidContentType.sonification,
      usageType: AndroidUsageType.assistanceSonification,
      audioFocus: AndroidAudioFocus.none,
    ),
  );

  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  bool isFile = false;
  bool looped = false;
  bool liked = false;

  @override
  void initState() {
    // TODO: implement initState
    // print(audio_path.toString().substring(audio_path.toString().length - 4));
    // print(audio_path.toString().length);
    // print(hive_medit
    //     .get('medit_${audio_id}')
    //     .toString().length);

    super.initState();
    if (Platform.isIOS) {
      AudioPlayer.global.setGlobalAudioContext(audioContext);
    }

    hive_medit.get('medit_${audio_id}') != null
        ? isFile = true
        : isFile = false;
    // downloadFile();

    // print(isFile);

    int values = 1;

    // setAudio();
    // audioPlayer.onPlayerStateChanged.listen((state) {
    //   setState(() {
    //     isPlaying = (state = PlayerState.playing) as bool;
    //   });
    // });

    audioPlayer.onDurationChanged.listen((newDuration) {
      setState(() {
        duration = newDuration;
      });
    });

    audioPlayer.onPositionChanged.listen((newPosition) async {
      setState(() {
        position = newPosition;
      });
      if ((duration.inSeconds - position.inSeconds == 0) &
          (audioPlayer.releaseMode.toString() == 'ReleaseMode.release')) {
        await affirmDoneRequest(Get.arguments[0]);
        setState(() {
          audioPlayer.stop();
          isPlaying = false;
        });
      } else {
        return;
      }
      // print(duration.inSeconds - position.inSeconds);
      // print(audioPlayer.releaseMode);
    });
  }

  void loop() {
    audioPlayer.setReleaseMode(ReleaseMode.loop);
  }

  void unloop() {
    audioPlayer.setReleaseMode(ReleaseMode.release);
  }

  void backward() {
    setState(() {
      var posi = position.inSeconds - 5;
      audioPlayer.seek(Duration(seconds: posi));
      // audioPlayer.resume();
    });
  }

  void forward() {
    setState(() {
      var posi = position.inSeconds + 5;
      audioPlayer.seek(Duration(seconds: posi));
      // audioPlayer.resume();
    });
  }

  String formatTime(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final hours = twoDigits(duration.inHours);
    final minutes = twoDigits(duration.inMinutes.remainder(60));
    final seconds = twoDigits(duration.inSeconds.remainder(60));

    return [if (duration.inHours > 0) hours, minutes, seconds].join(':');
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    super.dispose();
  }

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
            },
            icon: Icon(Icons.arrow_back),
          ),
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
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 70,
            ),
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Text(
                    audio_title,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  width: 85,
                  margin: EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    color: Color(0xff21cac8),
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.access_time_outlined,
                            size: 20,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 6,
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              '$audio_length мин',
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                BlurryContainer(
                  blur: 5.1,
                  width: double.infinity,
                  borderRadius: BorderRadius.circular(19),
                  color: Color(0xff0b0b0b).withOpacity(.51),
                  child: Container(
                    margin: EdgeInsets.all(22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        audio_desc.length <= 400
                            ? Text(
                                Bidi.stripHtmlIfNeeded(audio_desc),
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              )
                            : Text(
                                Bidi.stripHtmlIfNeeded(audio_desc.substring(
                                        0,
                                        (audio_desc.length -
                                                audio_desc.length * 0.3)
                                            .toInt()) +
                                    '...'),
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  height: 1.3,
                                ),
                              ),
                      ],
                    ),
                  ),
                ),
                Expanded(child: SizedBox()),
                Container(
                  margin: EdgeInsets.only(
                    top: 20,
                    bottom: 60,
                  ),
                  // height: 186,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(.6),
                    borderRadius: BorderRadius.circular(13),
                  ),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // IconButton(
                            //     onPressed: () async {
                            //      setState(() {
                            //
                            //      });
                            //
                            //     },
                            //     icon: Icon(
                            //       Icons.forward_10,
                            //       color: Colors.white,
                            //     )),
                            IconButton(
                              icon: SvgPicture.asset(
                                'assets/icons/loop.svg',
                                color: looped == false
                                    ? Colors.grey
                                    : Colors.white,
                              ),
                              iconSize: 24,
                              onPressed: () async {
                                setState(() {
                                  looped = !looped;
                                });
                                if (looped == true) {
                                  // print(looped);
                                  return loop();
                                } else {
                                  return unloop();
                                }
                              },
                            ),
                            IconButton(
                              icon: SvgPicture.asset(
                                  'assets/icons/play_back.svg'),
                              iconSize: 48,
                              onPressed: () async {
                                return backward();
                                // setState(() {
                                //   looped = !looped;
                                // });
                                // looped == true ? (audioPlayer.setReleaseMode(
                                //     ReleaseMode.loop)
                                // ) : null;
                              },
                            ),

                            Container(
                              // margin: EdgeInsets.only(left: 48),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                radius: 35,
                                child: isFile == true
                                    ? isPlaying == false
                                        ? IconButton(
                                            icon: SvgPicture.asset(
                                                'assets/icons/play_button.svg'),
                                            iconSize: 48,
                                            onPressed: () async {
                                              print(hive_medit
                                                      .get('medit_${audio_id}')
                                                      .toString() +
                                                  ' ССЫЛКА НА ФАЙЛ ');
                                              await audioPlayer.play(
                                                DeviceFileSource(
                                                  hive_medit
                                                      .get('medit_${audio_id}'),
                                                ),
                                              );
                                              // await audioPlayer.play(UrlSource(
                                              //     'https://kz.inspireapp.kz/' +
                                              //         audio_path));
                                              setState(
                                                () {
                                                  isPlaying = true;
                                                },
                                              );
                                            },
                                          )
                                        : IconButton(
                                            icon: Icon(Icons.pause),
                                            iconSize: 48,
                                            onPressed: () async {
                                              await audioPlayer.pause();
                                              setState(
                                                () {
                                                  isPlaying = false;
                                                },
                                              );
                                            },
                                          )
                                    : IconButton(
                                        icon: SvgPicture.asset(
                                          'assets/icons/play_button.svg',
                                          color: Colors.grey,
                                        ),
                                        iconSize: 48,
                                        onPressed: () async {},
                                      ),
                              ),
                            ),
                            IconButton(
                              icon: SvgPicture.asset(
                                  'assets/icons/play_forward.svg'),
                              iconSize: 48,
                              onPressed: () async {
                                return forward();
                              },
                            ),
                            Visibility(
                              visible: !isFile,
                              child: GestureDetector(
                                onTap: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Ваша медитация скачивается!',
                                      ),
                                    ),
                                  );
                                  downloadFile(file);
                                },
                                child:
                                    Icon(Icons.download, color: Colors.white),
                              ),
                            ),
                            Visibility(
                              visible: isFile,
                              child: IconButton(
                                icon: liked == false
                                    ? SvgPicture.asset(
                                        'assets/icons/like.svg',
                                        color: Colors.grey,
                                      )
                                    : SvgPicture.asset(
                                        'assets/icons/like_filled.svg',
                                      ),
                                iconSize: 24,
                                onPressed: () async {
                                  // print(audio_id);
                                  await doLike(audio_id);
                                  setState(
                                    () {
                                      liked = !liked;
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                formatTime(position),
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                              Text(
                                formatTime(duration - position),
                                style: GoogleFonts.poppins(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          // width: double.infinity,
                          child: Slider(
                            inactiveColor: Color(0xffBCC9C5),
                            activeColor: Color(0xff5bb4b9),
                            min: 0,
                            max: duration.inSeconds.toDouble() + 1,
                            value: position.inSeconds.toDouble(),
                            onChanged: (value) async {
                              final position = Duration(seconds: value.toInt());
                              await audioPlayer.seek(position);
                              await audioPlayer.resume();
                              setState(
                                () {
                                  isPlaying = true;
                                  // value.toInt() == duration.inSeconds
                                  //     ? print('НОЛЬ')
                                  //     : print(00000);
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool canplay = false;

  final file = null;

  Future<File?> downloadFile(file) async {
    final appStorage = await getApplicationDocumentsDirectory();
    file = File(
        '${appStorage.path}/medit_${audio_id}.${audio_path.split('.')[1]}');
    final response = await Dio().get(
      Const.domain + audio_path,
      options: Options(
        responseType: ResponseType.bytes,
        followRedirects: false,
        receiveTimeout: 0,
      ),
    );

    final raf = file.openSync(mode: FileMode.write);
    raf.writeFromSync(response.data);
    await raf.close();
    if (file.path != null) {
      setState(() {
        isFile = true;
      });
    } else {
      setState(() {
        isFile = false;
      });
    }
    print('${appStorage.path}/medit_${audio_id}.mp3');
    print(file.path.toString() + ' 123123123');

    var filepath =
        file.path.toString().substring(file.path.toString().length - 4) ==
                'net)'
            ? file.path.toString().replaceAll('net)', 'mp3')
            : file.path.toString().substring(file.path.toString().length - 4) ==
            '.com'
            ? file.path.toString().replaceAll('.com', '.mp3')
            : file.path.toString().substring(file.path.toString().length - 4) ==
            'com)'
            ? file.path.toString().replaceAll('com)', 'mp3')
            : file.path.toString();

    print(filepath);

    await hive_medit.put('medit_${audio_id}', filepath);
    return file;
  }
}
