import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:email_sender/views/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late VideoPlayerController controller;
  //late VideoPlayerController controller;
  //late VideoPlayerController controller;
  //late VideoPlayerController controller;

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    });

    //  loadVideoPlayer();

    super.initState();
  }

  loadVideoPlayer() {
    controller = VideoPlayerController.asset('images/servano2.MP4')
      ..addListener(() {})
      ..setVolume(1.0)
      ..initialize()
      ..play();
  }

  /* @override
  void dispose() {
    super.dispose();
    // TODO: implement dispose
    controller.dispose();
  }
*/
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 150,
                decoration: BoxDecoration(
                    //color: Colors.pink,
                    image: DecorationImage(
                        image: AssetImage("images/logo2.jpeg"))),
              ), /*AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: VideoPlayer(controller),
              ),*/
            ),
            SizedBox(
              height: 10,
            ),
            Center(child: _typer()),
          ],
        ),
      ),
    );
  }

  Widget _typer() {
    return SizedBox(
      child: DefaultTextStyle(
        style: const TextStyle(
            fontSize: 40.0, fontFamily: 'poppins', fontWeight: FontWeight.bold),
        child: AnimatedTextKit(isRepeatingAnimation: false, animatedTexts: [
          TyperAnimatedText('SERVANO',
              speed: Duration(milliseconds: 500), curve: Curves.easeIn),
        ]),
      ),
    );
  }
}
