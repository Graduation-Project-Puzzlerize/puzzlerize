import 'package:flutter/material.dart';
import 'package:puzzlerize/services/database.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:puzzlerize/screens/answer/answer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuestionScreen extends StatefulWidget {
  final String mentor_id, pin;
  QuestionScreen({required this.mentor_id, required this.pin});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  final TextToSpeech tts = new TextToSpeech();

  late List<QueryDocumentSnapshot<Map<String, dynamic>>> question;
  String questionTilte = '';
  String opt1 = '';
  String opt2 = '';
  String opt3 = '';
  String opt4 = '';

  Future<void> getQuestionInfo() async {
    question = await DatabaseMethods().getQuestions(widget.mentor_id);
    questionTilte = question[0]['question'];
    opt1 = await DatabaseMethods().getOpt1(widget.mentor_id);
    opt2 = await DatabaseMethods().getOpt2(widget.mentor_id);
    opt3 = await DatabaseMethods().getOpt3(widget.mentor_id);
    opt4 = await DatabaseMethods().getOpt4(widget.mentor_id);
    print(questionTilte + "p" + opt1 + "p" + opt2);
    setState(() {
      questionTilte = questionTilte;
      opt1 = opt1;
      opt2 = opt2;
      opt3 = opt3;
      opt4 = opt4;
    });
  }

  void startReadingQuestion() {
    tts.speak(
        "The question is ${questionTilte}. The options are: Option one: ${opt1}, Option two: ${opt2}, Option three: ${opt3}, Option four: ${opt4}");
  }

  void moveToCorrectAnswer() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => AnswerScreen(
              mentor_id: widget.mentor_id,
              question_id: question[0].id,
              pin: widget.pin)),
    );
  }

  @override
  void initState() {
    super.initState();
    getQuestionInfo();
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
              child: Card(
                  child: Center(
                      child: Text(
                    questionTilte,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.blueGrey),
                    textAlign: TextAlign.center,
                  )),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.blueGrey, width: 2))),
            ),
            SizedBox(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 150,
                height: 100,
                child: Card(
                  color: Color.fromARGB(255, 67, 204, 90),
                  child: Center(
                      child: Text(
                    opt1,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.center,
                  )),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                width: 150,
                height: 100,
                child: Card(
                  color: Color.fromARGB(255, 250, 132, 215),
                  child: Center(
                      child: Text(
                    opt2,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.center,
                  )),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ])),
            SizedBox(
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 150,
                height: 100,
                child: Card(
                  color: Color.fromARGB(255, 107, 110, 255),
                  child: Center(
                      child: Text(
                    opt3,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.center,
                  )),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              ),
              SizedBox(
                width: 150,
                height: 100,
                child: Card(
                  color: Color.fromARGB(255, 255, 174, 0),
                  child: Center(
                      child: Text(
                    opt4,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                    textAlign: TextAlign.center,
                  )),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
              )
            ])),
            ElevatedButton(
              onPressed: startReadingQuestion,
              child: Text("Read Question and options"),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 136, 101, 142),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromARGB(255, 79, 8, 83)),
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: moveToCorrectAnswer,
              child: Text("Show correct Answer"),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 136, 101, 142),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromARGB(255, 79, 8, 83)),
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            )
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
