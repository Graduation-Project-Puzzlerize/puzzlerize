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
      print(players);
    });
  }

  @override
  void initState() {
    getWinners();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Image.asset(
              "assets/images/logo.png",
            ),
            Image.asset(
              "assets/images/congrats.gif",
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                // Padding(
                // padding: const EdgeInsets.fromLTRB(15, 370, 3, 10),
                // child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          players.length > 2 ? players[2]['avatar'] : ""),
                      radius: 50,
                    ),
                    Image.asset(
                      "assets/images/bronzeTrophy.png",
                      height: 120,
                      width: 100,
                    ),
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 131, 3, 151),
                      ),
                      child: Center(
                          child: Text(
                        players.length > 2
                            ? players[2]['nickname']
                            : "", // Check if players list has at least two elements and access 'nickname' //replace this text with player name
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 100,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(146, 134, 2, 155),
                      ),
                      child: Center(
                          child: Text(
                        "Score: ${players.length > 2 ? players[2]['score'] : ""} ", //replace this text with player score // Check if players list has at least two elements and access 'score' "${players[0]['score']} out of 30", // replace this with player score
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                    ),
                  ],
                  // ),
                ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(8, 290, 3, 10),
                //   child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          players.isNotEmpty ? players[0]['avatar'] : ""),
                      radius: 50,
                    ),
                    Image.asset(
                      "assets/images/goldTrophy.png",
                      height: 130,
                      width: 120,
                    ),
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 131, 3, 151),
                      ),
                      child: Center(
                          child: Text(
                        players.isNotEmpty ? players[0]['nickname'] : "",
                        //replace this text with player name
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 170,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(146, 134, 2, 155),
                      ),
                      child: Center(
                          child: Text(
                        "Score: ${players.isNotEmpty ? players[0]['score'] : ""} ", //replace this text with player score
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                    ),
                  ],
                ),
                // ),
                // Padding(
                //   padding: const EdgeInsets.fromLTRB(8, 350, 5, 10),
                //   child:
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(
                          players.length > 1 ? players[1]['avatar'] : ""),
                      radius: 50,
                    ),
                    Image.asset(
                      "assets/images/silverTrophy.png",
                      height: 120,
                      width: 100,
                    ),
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 131, 3, 151),
                      ),
                      child: Center(
                          child: Text(
                        players.length > 1
                            ? players[1]['nickname']
                            : "", //replace this text with player name
                        style: TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 255, 255, 255),
                        ),
                      )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        color: Color.fromARGB(146, 134, 2, 155),
                      ),
                      child: Center(
                          child: Text(
                        "Score: ${players.length > 1 ? players[1]['score'] : ""}", //replace this text with player score
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
