import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:puzzlerize/services/database.dart';

class Winner extends StatefulWidget {
  final String
      pin; //It should get it's question_id from the question page from the teacher
  Winner({required this.pin});

  @override
  _WinnerScreenState createState() => _WinnerScreenState();
}

class _WinnerScreenState extends State<Winner> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  List players = [];

  getWinners() async {
    List<QueryDocumentSnapshot> listDocs =
        await DatabaseMethods().getWinners(widget.pin);

    setState(() {
      players = listDocs.map((doc) => doc.data()).toList();
    });
  }

  @override
  void initState() {
    // getWinners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Image(
              image: AssetImage('assets/images/logo.png'),
              fit: BoxFit.fill,
            ),
            Image(
              image: AssetImage('assets/images/congrats.gif'),
              fit: BoxFit.fill,
            ),
            Row(
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/trophy(7).png",
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 131, 3, 151),
                      ),
                      child: Center(
                          child: Text(
                        players.length >= 1
                            ? players[2]['nickname'] ?? ""
                            : "", // Check if players list has at least two elements and access 'nickname' //replace this text with player name
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(146, 134, 2, 155),
                      ),
                      child: Center(
                          child: Text(
                        "${players.isNotEmpty ? players[2]['score'] ?? "" : ""} ", //replace this text with player score // Check if players list has at least two elements and access 'score' "${players[0]['score']} out of 30", // replace this with player score
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/trophy(6).png",
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 131, 3, 151),
                      ),
                      child: Center(
                          child: Text(
                        players.isNotEmpty ? players[0]['nickname'] ?? "" : "",
                        //replace this text with player name
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(146, 134, 2, 155),
                      ),
                      child: Center(
                          child: Text(
                        "${players.isNotEmpty ? players[0]['score'] : ""} ", //replace this text with player score
                        style: TextStyle(
                          fontSize: 10,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(
                      "assets/images/trophy(5).png",
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 131, 3, 151),
                      ),
                      child: Center(
                          child: Text(
                        players.isNotEmpty
                            ? players[1]['nickname'] ?? ""
                            : "", //replace this text with player name
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(146, 134, 2, 155),
                      ),
                      child: Center(
                          child: Text(
                        "${players.isNotEmpty ? players[2]['score'] ?? "" : ""} ", //replace this text with player score
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                    ),
                  ],
                ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
