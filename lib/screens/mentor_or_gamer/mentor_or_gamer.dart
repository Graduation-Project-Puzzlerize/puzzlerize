import 'package:flutter/material.dart';
import 'package:puzzlerize/screens/pin/pin.dart';
import 'package:puzzlerize/screens/login/login.dart';
import 'package:puzzlerize/screens/visual_impairment_q/visual_impairment_q.dart';

class MentorOrGamer extends StatefulWidget {
  const MentorOrGamer({Key? key}) : super(key: key);

  @override
  State<MentorOrGamer> createState() => _MentorOrGamerState();
}

class _MentorOrGamerState extends State<MentorOrGamer> {
  GlobalKey<ScaffoldState> scaffoldkey = GlobalKey<ScaffoldState>();

  void navigateToPINScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PINScreen()),
    );
  }

  void navigateToLoginScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  void navigateToVisualImpairmentQScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VisualImpairmentQ()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage('assets/images/image.jpeg'),
              height: 200,
              width: 230,
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 60,
              child: Text(
                "Are you Gamer or Mentor?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 170,
              child: ElevatedButton(
                onPressed: navigateToPINScreen,
                child: Text("Gamer"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 80, 5, 85),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(255, 29, 10, 27)),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              width: 170,
              child: ElevatedButton(
                onPressed: navigateToLoginScreen,
                child: Text("Mentor"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 136, 101, 142),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(255, 79, 8, 83)),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            ElevatedButton(
              onPressed: navigateToVisualImpairmentQScreen,
              child: Text("Back"),
              style: ElevatedButton.styleFrom(
                primary: Color.fromARGB(255, 136, 101, 142),
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color.fromARGB(255, 79, 8, 83)),
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            SizedBox(
              height: 60,
              child: Text(
                "Ready to Start!",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
