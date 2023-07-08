import 'package:flutter/material.dart';

class myGames extends StatelessWidget {
  const myGames({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Text(
              "My Puzzlerize Game",
              style: TextStyle(
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.w500,
                fontFamily: 'Times New Roman',
              ),
            ),
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 106, 27, 154),
                    ),
                    child: SizedBox(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.4,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/puzz.PNG",
                            width: screenWidth * 0.6,
                          ),
                          Positioned(
                            bottom: screenHeight * 0.003,
                            left: screenWidth * 0.015,
                            child: Text(
                              'Four Team',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.036,
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
                  width: screenWidth * 0.07,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 106, 27, 154),
                    ),
                    child: SizedBox(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.4,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/puzz.PNG",
                            width: screenWidth * 0.6,
                          ),
                          Positioned(
                            bottom: screenHeight * 0.003,
                            left: screenWidth * 0.015,
                            child: Text(
                              'Engineers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.036,
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
              height: screenHeight * 0.04,
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 106, 27, 154),
                    ),
                    child: SizedBox(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.4,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/puzz.PNG",
                            width: screenWidth * 0.6,
                          ),
                          Positioned(
                            bottom: screenHeight * 0.003,
                            left: screenWidth * 0.015,
                            child: Text(
                              'Math Team',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.036,
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
                  width: screenWidth * 0.07,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: screenWidth * 0.05,
                  ),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 106, 27, 154),
                    ),
                    child: SizedBox(
                      width: screenWidth * 0.4,
                      height: screenWidth * 0.4,
                      child: Stack(
                        children: [
                          Image.asset(
                            "assets/images/puzz.PNG",
                            width: screenWidth * 0.6,
                          ),
                          Positioned(
                            bottom: screenHeight * 0.003,
                            left: screenWidth * 0.015,
                            child: Text(
                              'Programmers',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: screenWidth * 0.036,
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
              height: screenHeight * 0.07,
            ),
            ElevatedButton(
              child: Text(
                "CREATE NEW \n PUZZILIRZE",
                style: TextStyle(
                  fontSize: screenWidth * 0.043,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  letterSpacing: screenWidth * 0.01,
                  height: 1.5,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 176, 122, 211),
                ),
                padding: MaterialStateProperty.all(
                  EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.23,
                    vertical: screenHeight * 0.035,
                  ),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(screenWidth * 0.05),
                    side: BorderSide(
                      color: Color.fromARGB(255, 106, 27, 154),
                      width: screenWidth * 0.015,
                    ),
                  ),
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
