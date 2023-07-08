import 'package:flutter/material.dart';
import 'package:puzzlerize/services/database.dart';

class AnswerScreen extends StatefulWidget {
  final String
      question_id; //It should get it's question_id from the question page from the teacher
  AnswerScreen({required this.question_id});

  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  num answer = 0;
  num correctAnswers = 0;
  num wrongAnswers = 0;

  Future<num> rightAnswer() async {
    answer = await DatabaseMethods().getTheRightAnswer(widget.question_id);
    correctAnswers = await DatabaseMethods().correctAnswers(answer);
    wrongAnswers = await DatabaseMethods().wrongAnswers(answer);
    setState(() {
      answer = answer;
      correctAnswers = correctAnswers;
      wrongAnswers = wrongAnswers;
    });
    return answer;
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
            )
          ],
        ))));
  }
}
