import 'package:flutter/material.dart';
import 'package:my_life/references/frequently_used_variables.dart';
import 'package:video_player/video_player.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Load the video asset
    VideoPlayerController controller =
        VideoPlayerController.asset('assets/videos/splash_video.mp4');
    controller.setLooping(true);
    controller.initialize().then((_) {
      controller.play();
    });

    return SizedBox(
      height: height(context),
      child: Scaffold(
        body: Container(
          decoration:
              const BoxDecoration(color: Color.fromARGB(255, 200, 230, 201)),
          child: Center(
            child: Stack(
              children: [
                SizedBox(
                  width: width(context) - 30,
                  height: width(context) - 30,
                  child: AspectRatio(
                    aspectRatio: controller.value.aspectRatio,
                    child: VideoPlayer(controller),
                  ),
                ),
                SizedBox(
                  width: width(context) - 30,
                  height: width(context) - 30,
                  child: CircularProgressIndicator(
                    strokeWidth: 10,
                    color: Colors.green[900],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
