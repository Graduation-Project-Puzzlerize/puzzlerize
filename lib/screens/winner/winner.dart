import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class winner extends StatefulWidget {
  @override
  _winnerScreenState createState() => _winnerScreenState();
}

class _winnerScreenState extends State<winner> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  List players = [];

  getData() async {
    CollectionReference playersRef =
        FirebaseFirestore.instance.collection("players");
    QuerySnapshot qs =
        await playersRef.orderBy("score", descending: true).get();
    List<QueryDocumentSnapshot> listDocs = qs.docs;
    listDocs.forEach((element) {
      print(element.data());
      print("####################");
    });
    setState(() {
      players = listDocs.map((doc) => doc.data()).toList();
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            SizedBox(
              height: 80,
            ),
            Text(
              'Game Result',
              style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Times New Roman'),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(15, 370, 3, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/trophy(7).png",
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
                          players.length >= 1
                              ? players[2]['nickname'] ?? ""
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
                          "${players.isNotEmpty ? players[2]['score'] ?? "" : ""} out of 30", //replace this text with player score // Check if players list has at least two elements and access 'score' "${players[0]['score']} out of 30", // replace this with player score
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 290, 3, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/trophy(6).png",
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
                          players.isNotEmpty
                              ? players[0]['nickname'] ?? ""
                              : "",
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
                          "${players.isNotEmpty ? players[0]['score'] ?? "" : ""} out of 30", //replace this text with player score
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 350, 5, 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/trophy(5).png",
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
                          players.isNotEmpty
                              ? players[1]['nickname'] ?? ""
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
                          "${players.isNotEmpty ? players[1]['score'] ?? "" : ""} out of 30", //replace this text with player score
                          style: TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 255, 255, 255),
                          ),
                        )),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
