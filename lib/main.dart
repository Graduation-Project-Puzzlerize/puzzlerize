import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:puzzlerize/screens/welcome_screen/welcome_screen.dart';
import 'package:flutter_tts/flutter_tts.dart';

// import 'package:puzzlerize/screens/login/login.dart';

void main() => runApp(MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => MyApp(),
        '/main': (context) => WelcomeScreen(),
        // '/main': (context) => LoginScreen(),
      },
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => WelcomeScreen()),
        // MaterialPageRoute(builder: (context) => LoginScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset('assets/images/splash_screen.png'),
      ),
    );
  }
}




// import 'package:application_2/Answer.dart';
// import 'package:application_2/PIN.dart';
// import 'package:application_2/Question.dart';
// import 'package:application_2/profile.dart';
// import 'package:application_2/test.dart';
// import 'package:application_2/logIn.dart';
// import 'package:application_2/SignUp.dart';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home:LoginScreen(),
//     );
//   }
// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
       
//       ),
//       body: Center(
//         child: Column(
         
//       ),
//     ));
//   }