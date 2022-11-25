import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
// import 'package:vimeo_video_player/vimeo_video_player.dart';
import 'package:pod_player/pod_player.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({Key? key}) : super(key: key);

  @override
  State<VideoPlayer> createState() =>
      _VideoPlayerState();
}

class _VideoPlayerState
    extends State<VideoPlayer> {
  late final PodPlayerController controller;

  String video = Get.arguments[1];
  String video_title = Get.arguments[0];

  @override
  void initState() {
    // String videoId = '518228118';
    // String token = 'dd900159caf99d76f291fc694abc8f9b';
    // final Map<String, String> headers = <String, String>{};
    // headers['Authorization'] = 'Bearer ${token}';
    //
    // controller = PodPlayerController(
    //   playVideoFrom: PlayVideoFrom.vimeoPrivateVideos(
    //       videoId,
    //       httpHeaders: headers
    //   ),
    // )..initialise();
    // super.initState();

    controller = PodPlayerController(
      playVideoFrom: PlayVideoFrom.vimeo(video),
    )..initialise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF15162B), //FF15162B // 0xFFF2F2F2
        appBar: MediaQuery.of(context).orientation == Orientation.portrait
            ? AppBar(
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(Icons.arrow_back_ios),
                ),
                title: Text('$video_title'),
                backgroundColor: Colors.transparent,
                elevation: 0,
              )
            : PreferredSize(
                child: Container(
                  color: Colors.transparent,
                ),
                preferredSize: Size(0.0, 0.0),
              ),
        body: PodVideoPlayer(controller: controller));
  }
}
