import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:get/get.dart';
import 'package:avatar_glow/avatar_glow.dart';

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
    Future.delayed(Duration(seconds: 2), () {
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
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.fromLTRB(30, 155, 30, 0),
              child: Text(_text),
            ),
          )
        ],
      ),
    );
  }

  void _listen() async {
    // if (!_isListening) {
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
