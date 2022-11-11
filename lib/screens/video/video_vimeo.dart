import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:vimeo_video_player/vimeo_video_player.dart';

class VideoPlayer extends StatelessWidget {
  VideoPlayer({Key? key}) : super(key: key);

  String video = Get.arguments[1];
  String video_title = Get.arguments[0];

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
        body: ListView(children: <Widget>[
          VimeoVideoPlayer(

            vimeoPlayerModel: VimeoPlayerModel(
              url: 'https://vimeo.com/$video',
              deviceOrientation: DeviceOrientation.landscapeRight,
              systemUiOverlay: const [
                SystemUiOverlay.top,
                SystemUiOverlay.bottom,
              ],
            ),
          ),
          //   id: video.toString(),
          //   autoPlay: true,
          //   loaderColor: Colors.pink,
          //   fullScreenByDefault: true,
          //   loaderBackgroundColor: Color(0xff21cac8),
          // ),
        ]));
  }
}
