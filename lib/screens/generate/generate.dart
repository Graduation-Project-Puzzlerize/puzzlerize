import 'package:flutter/material.dart';
import 'dart:math';
import 'package:puzzlerize/services/database.dart';
import 'package:puzzlerize/screens/meet/meet.dart';

class Generate extends StatefulWidget {
  final String mentor_id;
  Generate({required this.mentor_id});

  @override
  _GenerateScreenState createState() => _GenerateScreenState();
}

String pin = "";

class _GenerateScreenState extends State<Generate> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    pin = (100 + Random().nextInt((999 + 1) - 100)).toString();
    print(pin[0]);
    DatabaseMethods().addRound(pin, widget.mentor_id);
    super.initState();
  }

  void navigateToMeetScreen() async {
    List players = await DatabaseMethods().getPlayers(pin);

    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Meet(
                mentor_id: widget.mentor_id,
                pin: pin,
                players: players,
              )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/PIN.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                "PIN for this round",
                style: TextStyle(
                  color: Color.fromARGB(255, 73, 2, 85),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                  child: Row(children: [
                Image(image: AssetImage("assets/images/${pin[0]}.PNG")),
                Image(image: AssetImage("assets/images/${pin[1]}.PNG")),
                Image(image: AssetImage("assets/images/${pin[2]}.PNG"))
              ])),
              SizedBox(
                height: 39,
              ),
              ElevatedButton(
                onPressed: navigateToMeetScreen,
                child: Text("Meet Players"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 80, 5, 85),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(255, 29, 10, 27)),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
