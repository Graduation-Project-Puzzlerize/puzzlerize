import 'package:flutter/material.dart';
import 'package:puzzlerize/services/database.dart';

class Options extends StatefulWidget {
  final String pin, player_id;
  Options({required this.pin, required this.player_id});

  @override
  _OptionsScreenState createState() => _OptionsScreenState();
}

class _OptionsScreenState extends State<Options> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  num answer = 0;

  void naivigateToSubResult() {
    DatabaseMethods().addResponse(answer, widget.player_id, widget.pin);
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              Options(pin: widget.pin, player_id: widget.player_id)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            flex: 1,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                    flex: 1,
                    child: Container(
                        height: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 132, 250,
                                177), // Set desired background color
                          ),
                          onPressed: () {
                            answer = 1;
                            naivigateToSubResult();
                          },
                          child: Text(
                            '1',
                            style: TextStyle(
                              fontSize: 100, // Set desired font size
                            ),
                          ),
                        ))),
                Expanded(
                  flex: 1,
                  child: Container(
                      height: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 250, 132,
                              215), // Set desired background color
                        ),
                        onPressed: () {
                          answer = 2;
                          naivigateToSubResult();
                        },
                        child: Text(
                          '2',
                          style: TextStyle(
                            fontSize: 100, // Set desired font size
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Flex(
              direction: Axis.horizontal,
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                      height: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          answer = 3;
                          naivigateToSubResult();
                        },
                        child: Text(
                          '3',
                          style: TextStyle(
                            fontSize: 100, // Set desired font size
                          ),
                        ),
                      )),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                      height: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 255, 174,
                                0) // Set desired background color
                            ),
                        onPressed: () {
                          answer = 4;
                          naivigateToSubResult();
                        },
                        child: Text(
                          '4',
                          style: TextStyle(
                            fontSize: 100, // Set desired font size
                          ),
                        ),
                      )),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
