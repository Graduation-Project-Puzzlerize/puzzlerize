import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lottie/lottie.dart';

class ready extends StatelessWidget {
  const ready({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset(
                "assets/images/are_you_ready.PNG",
                // width: 500,
              ),
              Center(
                child: AnimatedSwitcher(
                  duration: Duration(seconds: 1),
                  child: NumberThreeAnimation(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NumberThreeAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/images/newScene(3).json',
      repeat: false,
    );
  }
}
