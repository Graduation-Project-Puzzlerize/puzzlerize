import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:puzzlerize/screens/options/options.dart';

class ready extends StatefulWidget {
  final String pin, player_id;
  ready({required this.pin, required this.player_id});

  @override
  _readyScreenState createState() => _readyScreenState();
}

class _readyScreenState extends State<ready> {
  final TextToSpeech tts = new TextToSpeech();

  void initState() {
    super.initState();
    tts.readySpeak();

    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                Options(pin: widget.pin, player_id: widget.player_id)),
      );
    });
  }

  // const ready({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset(
                "assets/images/are_you_ready.PNG",
                // width: 500,
              ),
              Center(
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: NumberThreeAnimation(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NumberThreeAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/images/newScene(3).json',
      repeat: false,
    );
  }
}

class TextToSpeech extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  readySpeak() {
    flutterTts.setLanguage("en-US");
    flutterTts.setPitch(1); //0.5 to 1.5
    flutterTts.speak("Are you ready? 3, 2, 1");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
