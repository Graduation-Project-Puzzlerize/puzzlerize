import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class QuestionScreen extends StatefulWidget {
  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
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
                      " What is the reason for your happiness ?",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.blueGrey),
                      textAlign: TextAlign.center,
                    )),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                )
              ],
            ))));
  }
}
