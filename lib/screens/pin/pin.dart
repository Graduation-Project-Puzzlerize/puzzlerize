import 'package:flutter/material.dart';
import 'package:puzzlerize/screens/visual_impairment_q/visual_impairment_q.dart';
import 'package:puzzlerize/screens/profile/profile.dart';
import 'package:puzzlerize/services/database.dart';

class PINScreen extends StatefulWidget {
  @override
  _PINScreenState createState() => _PINScreenState();
}

class _PINScreenState extends State<PINScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  String pin = '';
  bool pinIsValidVisi = false;
  TextEditingController pinController = TextEditingController();

  void navigateToVisualImpairmentQScreen() {
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
    if (await DatabaseMethods().isPINValid(pinController.text)) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    } else {
      print("helllllllllllllllo");
      setState(
        () {
          pinIsValidVisi = true;
        },
      );
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
                            textInputAction: TextInputAction.search,
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
}












// import 'package:flutter/material.dart';

// class pin extends StatelessWidget {
//   const pin({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//     child: Scaffold(
//       body: Container(
//         width: double.infinity,
//         child:Stack(children:[
        
        
//         Container(
//           padding: EdgeInsets.all(22),
//           alignment: Alignment.topCenter,
//           child:Image.asset(
//                       "assets/images/Capture2.PNG",
//                       width: 250,
//                       height: 200,
//                     ),
//         ),
        
//          Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             SizedBox(height: 170,),
//             Padding(
//               padding: EdgeInsets.all(25),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   SizedBox(height: 10,),
                  
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Expanded(
//               child: Container(
//                 decoration: BoxDecoration(
//                   color :Color.fromRGBO(190, 141, 218, 0.608),
                  
//                   borderRadius: BorderRadius.only(topLeft: Radius.circular(45), topRight: Radius.circular(60))
//                 ),
//                 child: SingleChildScrollView(
//                   child: Padding(
//                     padding: EdgeInsets.all(30),
//                     child: Column(
//                       children: <Widget>[
//                         SizedBox(height: 60,),
//                         Text( " Enter the PIN Number ",style:
//                                TextStyle(fontSize: 28, fontWeight: FontWeight.w600 ,color: Colors.white),
//                              ),
                             
//                         Container(
                          
//                           child: Column(
//                             children: <Widget>[
//                               SizedBox(height: 70,), 
//                               Container(
//                                 padding: EdgeInsets.all(10),
//                                 //color:BorderRadius.circular(100),

//                                 decoration: BoxDecoration(
//                                  borderRadius: BorderRadius.circular(10),
//                                   color: Color.fromARGB(255, 212, 208, 214),

//                                 ),
//                                 child:Container(
//                                   width: 250,
                                  
//                                 child:
//                                  TextField(
//                                   decoration: InputDecoration(
//                                     hintText: "PIN",
                                  
//                                   hintStyle: TextStyle(fontSize: 20 ,color: Colors.white),
                                  
//                                     contentPadding: EdgeInsets.symmetric(vertical: 8),

//                                   ),
//                                 ),),
//                               ),                          
//                              Container(
//                                 padding: EdgeInsets.all(20),

//                               ),
//                             ],
//                           ),
//                         ),
//                         SizedBox(height: 60,),
//                          Text("Are you ready to Play?", style: TextStyle(color: Colors.white,fontSize: 16),),
                        
                        
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//         ]),
//       ),
//     ),
//     );
//   }
// }