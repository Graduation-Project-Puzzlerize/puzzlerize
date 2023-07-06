import 'package:flutter/material.dart';

class myGames extends StatelessWidget {
  const myGames({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              //width: ,
              height: 80,
            ),
            Text(
              "My Puzzlerize Game",
              style: TextStyle(
                  fontSize: 29,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Times New Roman'),
            ),
            SizedBox(
              //width: ,
              height: 30,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 106, 27, 154),
                    ),
                    child: SizedBox(
                      width: 160,
                      height: 160,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/puzz.PNG",
                            width: 250,
                          ),
                          Positioned(
                            bottom: 3.0, // Adjust the positioning as needed
                            left: 7.0, // Adjust the positioning as needed
                            child: Text(
                              'Four Team',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 106, 27, 154),
                    ),
                    child: SizedBox(
                      width: 160,
                      height: 160,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/puzz.PNG",
                            width: 250,
                          ),
                          Positioned(
                            bottom: 3.0, // Adjust the positioning as needed
                            left: 7.0, // Adjust the positioning as needed
                            child: Text(
                              'Engineers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              // width: 50,
              height: 40,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 106, 27, 154),
                    ),
                    child: SizedBox(
                      width: 160,
                      height: 160,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/puzz.PNG",
                            width: 250,
                          ),
                          Positioned(
                            bottom: 3.0, // Adjust the positioning as needed
                            left: 7.0, // Adjust the positioning as needed
                            child: Text(
                              'Math Team',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                  height: 30,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16.0),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 106, 27, 154),
                    ),
                    child: SizedBox(
                      width: 160,
                      height: 160,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/puzz.PNG",
                            width: 250,
                          ),
                          Positioned(
                            bottom: 3.0, // Adjust the positioning as needed
                            left: 7.0, // Adjust the positioning as needed
                            child: Text(
                              'Programmers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 50,
              height: 80,
            ),
            ElevatedButton(
              child: Text(
                "CREATE NEW \n PUZZILIRZE",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3.0,
                  height: 1.5,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                    Color.fromARGB(255, 176, 122, 211)),
                padding: MaterialStateProperty.all(
                    EdgeInsets.symmetric(horizontal: 70, vertical: 28)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                  side: BorderSide(
                      color: Color.fromARGB(255, 106, 27, 154), width: 3.0),
                )),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
