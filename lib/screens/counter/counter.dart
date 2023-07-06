import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(counter());
}

class counter extends StatelessWidget {
  const counter({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: AnimatedSwitcher(
            duration: Duration(seconds: 1),
            child: NumberThreeAnimation(),
          ),
        ),
      ),
    );
  }
}

class NumberThreeAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 2), () {
    //   Navigator.of(context).push(
    //     PageRouteBuilder(
    //       transitionDuration: Duration(seconds: 1),
    //       pageBuilder: (, _, _) => NumberTwoAnimation(),
    //     ),
    //   );
    // });
    return Lottie.asset(
      'assets/78822-number-3-animation-three-animation.json',
      repeat: false,
      height: 300,
    );
  }
}

class NumberTwoAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Future.delayed(Duration(seconds: 2), () {
    //   Navigator.of(context).push(
    //     PageRouteBuilder(
    //       transitionDuration: Duration(seconds: 1),
    //       pageBuilder: (, _, _) => NumberOneAnimation(),
    //     ),
    //   );
    // });
    return Lottie.asset(
      'assets/78821-number-two-animation-2-animation.json',
      repeat: false,
      height: 300,
    );
  }
}

class NumberOneAnimation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      'assets/78626-number-one.json',
      repeat: false,
      height: 300,
    );
  }
}
