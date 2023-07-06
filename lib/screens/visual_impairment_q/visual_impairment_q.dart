import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:puzzlerize/screens/pin/pin.dart';
import 'package:puzzlerize/screens/mentor_or_gamer/mentor_or_gamer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Speech to Text Demo',
      home: VisualImpairmentQ(),
    );
  }
}

class VisualImpairmentQ extends StatefulWidget {
  @override
  _VisualImpairmentQState createState() => _VisualImpairmentQState();
}

class _VisualImpairmentQState extends State<VisualImpairmentQ> {
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _text = '';

  @override
  void initState() {
    super.initState();
    final TextToSpeech tts = new TextToSpeech();
    tts.speak();
    _speech = stt.SpeechToText();
    Future.delayed(Duration(seconds: 3), () {
      _listen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/images/visual_impairment_q.png"),
                    fit: BoxFit.cover),
              ),
              child: new Row(
                children: [
                  new GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => PINScreen()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(100, 155, 30, 0),
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/icons/yes.jpg"),
                              )),
                        ),
                      )),
                  new GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MentorOrGamer()),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(30, 155, 30, 0),
                        child: Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: AssetImage("assets/icons/no.jpg"),
                              )),
                        ),
                      ))
                ],
              ))
        ],
      ),
    );
  }

  void _listen() async {
    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) => setState(() {
          _text = val.recognizedWords;
          print(_text);
          if (_text.toLowerCase() == 'yes') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => PINScreen()),
            );
          }
          if (_text.toLowerCase() == 'no') {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MentorOrGamer()),
            );
          }
        }),
      );
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}

class TextToSpeech extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  speak() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1); //0.5 to 1.5
    await flutterTts.speak("Do you have a visual impairment?");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
