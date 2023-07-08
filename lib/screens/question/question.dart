import 'package:flutter/material.dart';
import 'package:puzzlerize/services/database.dart';
import 'package:puzzlerize/screens/winner/winner.dart';

class QuestionScreen extends StatefulWidget {
  final String mentor_id;
  QuestionScreen({required this.mentor_id});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  String question = '';
  String opt1 = '';
  String opt2 = '';
  String opt3 = '';
  String opt4 = '';

  Future<void> getQuestionInfo() async {
    question = await DatabaseMethods().getQuestion(widget.mentor_id);
    opt1 = await DatabaseMethods().getOpt1(widget.mentor_id);
    opt2 = await DatabaseMethods().getOpt2(widget.mentor_id);
    opt3 = await DatabaseMethods().getOpt3(widget.mentor_id);
    opt4 = await DatabaseMethods().getOpt4(widget.mentor_id);
    setState(() {
      question = question;
      opt1 = opt1;
      opt2 = opt2;
      opt3 = opt3;
      opt4 = opt4;
    });
  }

  void moveToNextQuestion() {
    DatabaseMethods().deleteQ(widget.mentor_id);
    Future.delayed(Duration(seconds: 3), () {
      if (question != '') {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  QuestionScreen(mentor_id: widget.mentor_id)),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => winner()),
        );
      }
    });
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
              height: 200,
              child: Card(
                  child: Center(
                      child: Text(
                    question,
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
                height: 150,
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
                height: 150,
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
                height: 150,
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
                height: 150,
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
              onPressed: moveToNextQuestion,
              child: Text("Next Question"),
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
