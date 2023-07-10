import 'package:flutter/material.dart';
import 'package:puzzlerize/services/database.dart';
import 'package:puzzlerize/screens/question/question.dart';
import 'package:puzzlerize/screens/winner/winner.dart';
import 'package:flutter_tts/flutter_tts.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class AnswerScreen extends StatefulWidget {
  final String mentor_id,
      question_id,
      pin; //It should get it's question_id from the question page from the teacher
  AnswerScreen(
      {required this.mentor_id, required this.question_id, required this.pin});

  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  final TextToSpeech tts = new TextToSpeech();

  num answer = 0;
  num correctAnswers = 0;
  num wrongAnswers = 0;

  Future<num> rightAnswer() async {
    answer = await DatabaseMethods().getTheRightAnswer(widget.question_id);
    correctAnswers = await DatabaseMethods().correctAnswers(answer, widget.pin);
    wrongAnswers = await DatabaseMethods().wrongAnswers(answer, widget.pin);
    setState(() {
      answer = answer;
      correctAnswers = correctAnswers;
      wrongAnswers = wrongAnswers;
    });
    return answer;
  }

  void moveToNextQuestionORwinner() {
    print(widget.pin);
    DatabaseMethods().deleteQ(widget.mentor_id);
    DatabaseMethods().deleteResponses(widget.pin);

    Future.delayed(Duration(seconds: 3), () async {
      List<QueryDocumentSnapshot<Map<String, dynamic>>> questions =
          await DatabaseMethods().getQuestions(widget.mentor_id);
      if (questions.isNotEmpty) {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  QuestionScreen(mentor_id: widget.mentor_id, pin: widget.pin)),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Winner(pin: widget.pin)),
        );
      }
    });
  }

  void startReadingResults() {
    tts.speak(
        "The correct answer is ${answer}. Number of right answers ${correctAnswers}. Number of wrong answers ${wrongAnswers}");
  }

  @override
  void initState() {
    super.initState();
    rightAnswer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        key: scaffoldkey,
        body: Container(
            child: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.fill,
            ),
            SizedBox(
              width: 250,
              height: 100,
            ),
            SizedBox(
              width: 250,
              height: 200,
              child: Card(
                child: Center(
                    child: Text(
                  " The correct Answer is   " + answer.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.blueGrey),
                  textAlign: TextAlign.center,
                )),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check, color: Colors.green),
                SizedBox(width: 10),
                Text(correctAnswers.toString()),
                SizedBox(width: 20),
                Icon(Icons.close, color: Colors.red),
                SizedBox(width: 10),
                Text(wrongAnswers.toString()),
              ],
            ),
            ElevatedButton(
              onPressed: moveToNextQuestionORwinner,
              child: Text("Next"),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 136, 101, 142),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromARGB(255, 79, 8, 83)),
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: startReadingResults,
              child: Text("Read Question and options"),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 136, 101, 142),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromARGB(255, 79, 8, 83)),
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
          ],
        ))));
  }
}

class TextToSpeech extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  speak(String questionAndOptions) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1); //0.5 to 1.5
    await flutterTts.speak(questionAndOptions);
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
