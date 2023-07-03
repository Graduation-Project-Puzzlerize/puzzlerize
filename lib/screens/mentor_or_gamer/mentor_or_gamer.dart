import 'package:flutter/material.dart';

class MentorOrGamer extends StatefulWidget {
  const MentorOrGamer({super.key});

  @override
  State<MentorOrGamer> createState() => _MentorOrGamerState();
}

class _MentorOrGamerState extends State<MentorOrGamer> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      appBar: AppBar(),
      drawer: Drawer(),
      body: Container(
        width: 300,
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
                "Are you Gamer or Mentor ?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 60,
              width: 170,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Mentor"),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 80, 5, 85),
                    shape: ContinuousRectangleBorder(
                        side:
                            BorderSide(color: Color.fromARGB(255, 29, 10, 27)),
                        borderRadius: BorderRadius.circular(18.0))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 60,
              width: 170,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Gamer"),
                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 136, 101, 142),
                    shape: ContinuousRectangleBorder(
                      side: BorderSide(color: Color.fromARGB(255, 79, 8, 83)),
                      borderRadius: BorderRadius.circular(18.0),
                    )),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            SizedBox(
              height: 60,
              child: Text(
                "Ready to Start !",
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
