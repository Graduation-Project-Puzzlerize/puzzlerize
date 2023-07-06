import 'package:flutter/material.dart';

class meet extends StatelessWidget {
  const meet({Key? key}) : super(key: key);

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
                    "assets/images/meet-removebg-preview.PNG",
                    width: 1600,
                  ),
                  //const SizedBox(height: 50),
                  Center(
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 20.0),
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    "assets/images/face.png",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 40.0),
                            Text(
                              "Avery Davis",
                              textScaleFactor: 1.5,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 20.0),
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    "assets/images/face2.png",
                                  ),
                                ),
                              ),
                            ),

                            const SizedBox(width: 40.0),
                            Text(
                              "Howard ong",
                              textScaleFactor: 1.5,
                            ),
                            // Add your widgets for the second row here
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Row(
                          children: <Widget>[
                            const SizedBox(width: 20.0),
                            Container(
                              width: 80.0,
                              height: 80.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.fill,
                                  image: AssetImage(
                                    "assets/images/download.jpg",
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 40.0),
                            Text(
                              "Olivia Wilson",
                              textScaleFactor: 1.5,
                            ),
                            // Add your widgets for the second row here
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
                              //  fontFamily: 'Courier New',
                              color: Color.fromARGB(255, 10, 64, 111),
                              fontWeight: FontWeight.w900,
                              letterSpacing: 1.0,
                              height: 1.5,
                            ),
                          ),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                Color.fromARGB(255, 203, 227, 243)),
                            padding: MaterialStateProperty.all(
                                EdgeInsets.symmetric(
                                    horizontal: 25, vertical: 20)),
                            shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40),
                              side: BorderSide(
                                  color: Color.fromARGB(255, 10, 64, 111),
                                  width: 3.0),
                            )),
                          ),
                          onPressed: () {},
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
