import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();
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
                    hintText: "LOLO",
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
              )
            ]),
          )),
    );
  }
}
