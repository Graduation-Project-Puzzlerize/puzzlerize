import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:puzzlerize/screens/question/question.dart';

class ListenPage extends StatefulWidget {
  final String mentor_id;
  ListenPage({required this.mentor_id});

  @override
  _ListenPageState createState() => _ListenPageState();
}

class _ListenPageState extends State<ListenPage> {
  final FlutterTts flutterTts = FlutterTts();
  bool isSpeaking = false;

  @override
  void initState() {
    super.initState();
    speakMessage();
  }

  void speakMessage() async {
    setState(() {
      isSpeaking = true;
    });
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak("Get ready, listen carefully to the questions");
    setState(() {
      isSpeaking = false;
    });
  }

  void repeatMessage() {
    if (!isSpeaking) {
      speakMessage();
    }
  }

  void navigateToQuestionScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => QuestionScreen(mentor_id: widget.mentor_id)),
    );
  }

  @override
  void dispose() {
    flutterTts.stop();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/listen.jpeg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),
          Positioned(
            bottom: 20,
            left: 20,
            child: GestureDetector(
              onTap: navigateToQuestionScreen,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.arrow_forward, size: 20),
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            right: 20,
            child: GestureDetector(
              onTap: repeatMessage,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                padding: EdgeInsets.all(8),
                child: Icon(Icons.replay, size: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
