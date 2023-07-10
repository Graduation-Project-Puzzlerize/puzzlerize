import 'package:flutter/material.dart';
import 'package:puzzlerize/screens/listen/listen.dart';
import 'package:puzzlerize/services/database.dart';

class Meet extends StatefulWidget {
  final String mentor_id, pin;
  final List players;
  Meet({required this.mentor_id, required this.pin, required this.players});
  @override
  _MeetScreenState createState() => _MeetScreenState();
}

class _MeetScreenState extends State<Meet> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  void navigateToListenScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ListenPage(mentor_id: widget.mentor_id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: [
              Column(
                children: [
                  Image.asset(
                    "assets/images/meet-removebg-preview.png",
                    width: 1600,
                  ),
                  Center(
                    child: Column(
                      children: <Widget>[
                        const SizedBox(width: 20.0),
                        for (var player in widget.players)
                          Row(
                            children: <Widget>[
                              const SizedBox(width: 20.0),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    fit: BoxFit.fill, //player['avatar']
                                    //image: AssetImage("assets/images/ava.png"),
                                    image: AssetImage(
                                      player['avatar'],
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 40.0),
                              Text(
                                player['nickname'],
                                textScaleFactor: 1.5,
                              ),
                            ],
                          ),
                        SizedBox(
                          height: 65,
                        ),
                        ElevatedButton(
                          child: Text(
                            "START GAME",
                            style: TextStyle(
                              fontSize: 22,
                              color: Color.fromARGB(255, 10, 64, 111),
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.0,
                              height: 1.5,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              Color.fromARGB(255, 203, 227, 243),
                            ),
                            padding: MaterialStateProperty.all(
                              EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 20),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40),
                                side: BorderSide(
                                  color: Color.fromARGB(255, 10, 64, 111),
                                  width: 3.0,
                                ),
                              ),
                            ),
                          ),
                          onPressed: navigateToListenScreen,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
