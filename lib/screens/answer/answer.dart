import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AnswerScreen extends StatefulWidget {
  @override
  _AnswerScreenState createState() => _AnswerScreenState();
}

class _AnswerScreenState extends State<AnswerScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        appBar: AppBar(),
        drawer: Drawer(),
        body: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/QuestionPage.png'),
              fit: BoxFit.fill,
            )),
            child: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 250,
                  height: 200,
                  child: Card(
                    child: Center(
                        child: Text(
                      " The correct Answer is   ",
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
                    Text('10'),
                    SizedBox(width: 20),
                    Icon(Icons.close, color: Colors.red),
                    SizedBox(width: 10),
                    Text('5'),
                  ],
                )
              ],
            ))));
  }
}
