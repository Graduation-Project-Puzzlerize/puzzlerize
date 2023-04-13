import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class VisualImpairmentQ extends StatefulWidget {
  @override
  _VisualImpairmentQState createState() => _VisualImpairmentQState();
}

class _VisualImpairmentQState extends State<VisualImpairmentQ> {
  @override
  void initState() {
    super.initState();
    final TextToSpeech tts = new TextToSpeech();
    tts.speak();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/visual_impairment_q.png"),
                  fit: BoxFit.fill),
            ),
            child: TextToSpeech() /* add child content here */,
          )
          // SafeArea(
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Spacer(flex: 2), //2/6
          //       // Text(
          //       //   "Let's Play Quiz,",
          //       //   style: Theme.of(context).textTheme.headline4,
          //       // ),
          //       //Text("Enter your informations below"),
          //       Spacer(), // 1/6
          //       TextField(
          //         decoration: InputDecoration(
          //           filled: true,
          //           fillColor: Color(0xFF1C2341),
          //           hintText: "Full Nam",
          //           border: OutlineInputBorder(
          //             borderRadius: BorderRadius.all(Radius.circular(12)),
          //           ),
          //         ),
          //       ),
          //       Spacer(), // 1/6
          //       InkWell(
          //         child: Container(
          //           width: double.infinity,
          //           alignment: Alignment.center,
          //           decoration: BoxDecoration(
          //             borderRadius: BorderRadius.all(Radius.circular(12)),
          //           ),
          //           //child: Text("Lets Start Quiz",
          //           // style: Theme.of(context).textTheme.button),
          //         ),
          //       ),
          //       Spacer(flex: 2), // it will take 2/6 spaces
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}

class TextToSpeech extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();

  speak() async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1); //0.5 to 1.5
    await flutterTts.speak("Do you have a visual impairment, yes or no?");
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
