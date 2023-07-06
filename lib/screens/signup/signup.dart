import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUp> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/logo.jpeg'),
                height: 50,
                width: 200,
              ),
              Image(
                image: AssetImage('assets/images/2.jpeg'),
                height: 200,
                width: 200,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                  enabled: true,
                  labelText: " Name",
                  labelStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 29, 5, 115),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 68, 52, 125),
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  enabled: true,
                  labelText: " Email ",
                  labelStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 29, 5, 115),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 68, 52, 125),
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              // add some space between the text fields
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  enabled: true,
                  labelText: " Password ",
                  labelStyle: TextStyle(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 29, 5, 115),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 68, 52, 125),
                      width: 2,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                          Color.fromARGB(255, 68, 52, 125)),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      fixedSize: MaterialStateProperty.all(Size(300, 50)))),
              SizedBox(
                height: 10,
              ),
              Text("Already have an account ? ")
            ],
          ),
        ),
      ),
    );
  }
}






// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

// class signup extends StatelessWidget {
//   const signup({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: SizedBox(
//           height: double.infinity,
//           width: double.infinity,
//           child: Stack(
//             children: [
//               SizedBox(
//                 width: double.infinity,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     SizedBox(
//                       height: 23,
//                     ),
//                     Image.asset(
//                       "assets/images/Capture.PNG",
//                       width: 500,
//                     ),
//                     SizedBox(
//                       height: 15,
//                     ),
//                     Image.asset(
//                       "assets/images/Capture2.PNG",
//                       width: 250,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       "Sign Up",
//                       style:
//                           TextStyle(fontSize: 31, fontWeight: FontWeight.w800),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                        // color: Colors.purple[100],
//                         //borderRadius :
                      
//                         borderRadius: BorderRadius.circular(3),
//                         border: Border.all(
//                     color: Color.fromARGB(255, 109, 16, 126),
//                     width: 1,
//                   )
//                       ),
//                       width: 266,
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       child: TextField(
//                         decoration: InputDecoration(
//                             icon: Icon(
//                               Icons.person_pin_sharp,
//                               color: Colors.purple[800],
//                             ),
//                             hintText: "Name :",
//                             border: InputBorder.none),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 17,
//                     ),

//                     ///## onPressed:(){Navigator.pushNamed(context, "")},
//                     Container(
//                       decoration: BoxDecoration(
//                         ///color: Colors.purple[100],
//                         borderRadius: BorderRadius.circular(3),
//                         border: Border.all(
//                     color: Color.fromARGB(255, 109, 16, 126),
//                     width: 1,
//                   )
//                       ),
//                       width: 266,
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       child: TextField(
//                         decoration: InputDecoration(
//                             icon: Icon(
//                               Icons.email,
//                               color: Colors.purple[800],
//                             ),
//                             hintText: "Email :",
//                             border: InputBorder.none),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 17,
//                     ),
//                     Container(
//                       decoration: BoxDecoration(
//                         //color: Colors.purple[100],
//                         borderRadius: BorderRadius.circular(3),
//                         border: Border.all(
//                     color: Color.fromARGB(255, 109, 16, 126),
//                     width: 1,
//                   )
//                       ),
//                       width: 266,
//                       padding: EdgeInsets.symmetric(horizontal: 16),
//                       child: TextField(
//                         obscureText: true,
//                         decoration: InputDecoration(
//                             suffix: Icon(
//                               Icons.visibility,
//                               color: Colors.purple[900],
//                             ),
//                             icon: Icon(
//                               Icons.lock,
//                               color: Colors.purple[800],
//                               size: 19,
//                             ),
//                             hintText: "Password :",
                            
//                             border: InputBorder.none),
//                       ),
//                     ),
//                     SizedBox(
//                       height: 17,
//                     ),
//                     ElevatedButton(
//                       child: Text(
//                         "Sign Up",
//                         style: TextStyle(fontSize: 16, color: Colors.white,fontWeight: FontWeight.w600),
//                       ),
//                       style: ButtonStyle(
//                           backgroundColor:
//                               MaterialStateProperty.all(Colors.purple[800]),
//                           padding: MaterialStateProperty.all(
//                               EdgeInsets.symmetric(
//                                   horizontal: 100, vertical: 12)),
//                           shape: MaterialStateProperty.all(
//                               RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(3)))),
//                       onPressed: () {},
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text("Already have an account ?"),
//                         Text("Log in"),
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }