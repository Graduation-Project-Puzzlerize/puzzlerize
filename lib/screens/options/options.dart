import 'package:flutter/material.dart';

class Options extends StatefulWidget {
  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<Options> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        body: Container(
          child: Container(
            color: Colors.blueGrey[50],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Handle option selection
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("Option 1"),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Handle option selection
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("Option 2"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Handle option selection
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("Option 3"),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: GestureDetector(
                          onTap: () {
                            // Handle option selection
                          },
                          child: Card(
                            child: Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("Option 4"),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
