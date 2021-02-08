import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/services.dart';

class LearnScreen extends StatefulWidget {
  static const routeName = "/learn-screen";
  final videoId;
  final topic;
  LearnScreen(this.videoId, this.topic);

  @override
  _LearnScreenState createState() => _LearnScreenState();
}

class _LearnScreenState extends State<LearnScreen> {
  @override
  dispose() {
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );

    void _initVideoPlayer() {
      _controller.toggleFullScreenMode();
    }

    return WillPopScope(
      onWillPop: () {
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Container(
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: _controller,
                  topActions: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    SizedBox(width: 5),
                    Text(
                      widget.topic,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                  onReady: _initVideoPlayer,
                  onEnded: (_) => Navigator.of(context).pop(),
                ),
                builder: (context, player) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      player,
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
