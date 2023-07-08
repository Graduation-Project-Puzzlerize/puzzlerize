import 'package:flutter/material.dart';
import 'package:puzzlerize/screens/pin/pin.dart';
import 'package:puzzlerize/screens/ready/ready.dart';
import 'dart:math';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var avas = [
    'assets/images/ava1.PNG',
    'assets/images/ava2.PNG',
    'assets/images/ava3.PNG',
    'assets/images/ava4.PNG',
    'assets/images/ava5.PNG'
  ];
  int randAVA = Random().nextInt(5);
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  TextEditingController nicknameController = TextEditingController();
  void navigateToPINScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PINScreen()),
    );
  }

  void navigatereadyScreen() {
    if (nicknameController.text != '') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ready()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Container(
          child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          CircleAvatar(
            foregroundColor: Color(0),
            backgroundImage: AssetImage(avas[randAVA]),
            radius: 70,
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: EdgeInsets.all(15),
            child: TextField(
              controller: nicknameController,
              keyboardType: TextInputType.name,
              decoration: InputDecoration(
                hintText: "Nickname",
                enabled: true,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        width: 2, color: Color.fromARGB(255, 227, 221, 228))),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                        width: 2, color: Color.fromARGB(255, 227, 221, 228))),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: navigatereadyScreen,
            child: Text("Next"),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 136, 101, 142),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color.fromARGB(255, 79, 8, 83)),
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: navigateToPINScreen,
            child: Text("Back"),
            style: ElevatedButton.styleFrom(
              primary: Color.fromARGB(255, 136, 101, 142),
              shape: RoundedRectangleBorder(
                side: BorderSide(color: Color.fromARGB(255, 79, 8, 83)),
                borderRadius: BorderRadius.circular(18.0),
              ),
            ),
          ),
        ]),
      )),
    );
  }
}
