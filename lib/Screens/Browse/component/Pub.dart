import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:four/Composant/SizeConfiguration.dart';
import 'package:video_player/video_player.dart';

class Pub extends StatefulWidget {
  Pub();

  @override
  State<Pub> createState() => _PubState();
}

class _PubState extends State<Pub> {
  bool volumeState = true;
  bool videoState = true;
  late VideoPlayerController videoController;
  late Future<void> initializeVideoPlayerFuture;
  String videoUrl =
      'https://v1.pinimg.com/videos/mc/720p/49/49/03/49490336764a6ca6dccd1728e3d3b006.mp4';

  @override
  void initState() {
    super.initState();
    videoController = VideoPlayerController.network(videoUrl);
    initializeVideoPlayerFuture = videoController.initialize();
    videoController.setLooping(true);
    videoController.play();
  }

  @override
  void dispose() {
    videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: () {
            if (videoState) {
              videoController.pause();
            } else {
              videoController.play();
            }
            videoState = !videoState;
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  height: SizeConfiguration.defaultSize * 2.5,
                  width: SizeConfiguration.defaultSize * 4,
                  child: VideoPlayerWidget(
                    initializeVideoPlayerFuture: initializeVideoPlayerFuture,
                    videoController: videoController,
                  )),
            ],
          ),
        ),
        Positioned(
          right: -5,
          top: -10,
          child: IconButton(
              onPressed: () {
                if (volumeState) {
                  videoController.setVolume(0.0);
                } else {
                  videoController.setVolume(1.0);
                }
                volumeState = !volumeState;
              },
              icon: Icon(
                volumeState ? Icons.music_note_sharp : Icons.music_off_sharp,
                color: Colors.white,
                size: 28,
              )),
        )
      ],
    );
  }
}

class VideoPlayerWidget extends StatefulWidget {
  final initializeVideoPlayerFuture;
  final videoController;

  VideoPlayerWidget(
      {required this.initializeVideoPlayerFuture,
      required this.videoController});

  @override
  _VideoPlayerWidgetState createState() => _VideoPlayerWidgetState();
}

class _VideoPlayerWidgetState extends State<VideoPlayerWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.initializeVideoPlayerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return AspectRatio(
            aspectRatio: widget.videoController.value.aspectRatio,
            child: VideoPlayer(widget.videoController!),
          );
        } else {
          return Center(
              child: CircularProgressIndicator(
            color: Colors.deepPurple,
          ));
        }
      },
    );
  }
}
