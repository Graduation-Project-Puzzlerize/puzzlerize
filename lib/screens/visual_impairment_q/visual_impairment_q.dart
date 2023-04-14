import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class VisualImpairmentQ extends StatefulWidget {
  @override
  _VisualImpairmentQState createState() => _VisualImpairmentQState();
}

class _VisualImpairmentQState extends State<VisualImpairmentQ> {
  @override
  void initState() {
    super.initState();
    final TextToSpeech tts = new TextToSpeech();
    tts.speak();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/visual_impairment_q.png"),
                  fit: BoxFit.fill),
            ),
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 155, 30, 0),
              child: const TextField(
                  decoration: InputDecoration(hintText: 'Answer')),
            ),
          )
        ],
      ),
    );
  }
}

class TextToSpeech extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  speak() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1); //0.5 to 1.5
    await flutterTts.speak("Do you have a visual impairment, yes or no?");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
