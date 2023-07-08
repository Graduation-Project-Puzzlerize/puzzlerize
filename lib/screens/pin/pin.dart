import 'package:flutter/material.dart';
import 'package:puzzlerize/screens/visual_impairment_q/visual_impairment_q.dart';
import 'package:puzzlerize/screens/profile/profile.dart';
import 'package:puzzlerize/services/database.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class PINScreen extends StatefulWidget {
  @override
  _PINScreenState createState() => _PINScreenState();
}

class _PINScreenState extends State<PINScreen> {
  late stt.SpeechToText _speech;
  bool _isListening = false;

  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  String pin = '';
  bool pinIsValidVisi = false;
  bool isGone = false;
  TextEditingController pinController = TextEditingController();
  final TextToSpeech tts = new TextToSpeech();

  @override
  void initState() {
    super.initState();
    tts.enterThePINSpeak();
    _speech = stt.SpeechToText();

    Future.delayed(Duration(seconds: 5), () {
      if (!isGone) {
        listen();
      }
    });
    Future.delayed(Duration(seconds: 10), () {
      if (!isGone) {
        navigateToProfileScreen();
      }
    });
  }

  void navigateToVisualImpairmentQScreen() {
    setState(() {
      isGone = true;
    });
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => VisualImpairmentQ()),
    );
  }

  void navigateToProfileScreen() async {
    setState(
      () {
        pinIsValidVisi = false;
      },
    );
    if (await DatabaseMethods()
        .isPINValid(pinController.text.replaceAll(' ', ''))) {
      setState(() {
        _isListening = false;
        isGone = true;
      });
      _speech.stop();
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ProfileScreen(pin: pinController.text)),
      );
    } else {
      setState(
        () {
          pinIsValidVisi = true;
          _isListening = true;
        },
      );
      tts.pinInvalidSpeak(context);
      listen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/PIN.png'),
            fit: BoxFit.fill,
          )),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "PIN for this round ",
                style: TextStyle(
                  color: Color.fromARGB(255, 73, 2, 85),
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(5),
                child: Container(
                    width: 250,
                    height: 200,
                    child: new Column(children: [
                      Container(
                          child: TextField(
                            controller: pinController,
                            onSubmitted: (value) {
                              navigateToProfileScreen();
                            },
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: '',
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                              color: Color.fromARGB(255, 222, 212, 219))),
                      ElevatedButton(
                        onPressed: navigateToProfileScreen,
                        child: Text("Next"),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 136, 101, 142),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 79, 8, 83)),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: navigateToVisualImpairmentQScreen,
                        child: Text("Back"),
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 136, 101, 142),
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: Color.fromARGB(255, 79, 8, 83)),
                            borderRadius: BorderRadius.circular(18.0),
                          ),
                        ),
                      ),
                    ])),
              ),
              Visibility(
                child: Text(
                  "The PIN is invalid",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 0, 0),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                visible: pinIsValidVisi,
              ),
            ]),
          )),
    );
  }

  void listen() async {
    bool available = await _speech.initialize(
      onStatus: (val) => print('onStatus: $val'),
      onError: (val) => print('onError: $val'),
    );
    if (available) {
      setState(() => _isListening = true);
      _speech.listen(
        onResult: (val) => setState(() {
          pin = val.recognizedWords;
          pinController.text = pin;
          print(pin);
        }),
      );
    } else {
      setState(() => _isListening = false);
      _speech.stop();
    }
  }
}

class TextToSpeech extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  enterThePINSpeak() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1); //0.5 to 1.5
    await flutterTts.speak("ُEnter the P I N");
  }

  pinInvalidSpeak(BuildContext context) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1); //0.5 to 1.5
    await flutterTts.speak("The P I N is invalid, try again");
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => PINScreen()),
        (route) => false, // Remove all existing routes from the stack
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
