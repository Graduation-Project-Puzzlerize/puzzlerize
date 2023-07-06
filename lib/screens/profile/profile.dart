import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puzzlerize/screens/pin/pin.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
  void navigateToPINScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PINScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldkey,
      body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/lola.png'),
            fit: BoxFit.fill,
          )),
          child: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              CircleAvatar(
                foregroundColor: Color(0),
                backgroundImage: AssetImage('assets/images/ava.jpg'),
                radius: 70,
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    hintText: "Nickname",
                    enabled: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 227, 221, 228))),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(
                            width: 2,
                            color: Color.fromARGB(255, 227, 221, 228))),
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: navigateToPINScreen,
                child: Text("Back"),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 136, 101, 142),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color.fromARGB(255, 79, 8, 83)),
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
            ]),
          )),
    );
  }
}
