import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class listen extends StatelessWidget {
  const listen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Stack(
            children: <Widget>[
              Positioned(
                  top: 0,
                  right: -5,
                  child: Image.asset(
                    "assets/images/lis_top2-r.png",
                    height: 110,
                    width: 210,
                  )),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 200,
                    width: 100,
                  ),
                  Image.asset(
                    "assets/images/listen_img-r2.png",
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 55.0),
                    child: Row(
                      children: [
                        Text(
                          "Get ready, listen \ncarefully to \nthe questions\n\n",
                          style: TextStyle(
                            fontSize: 32,
                            //  fontFamily: 'Courier New',
                            color: Color.fromARGB(255, 10, 64, 111),
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.0,
                            height: 1.2,
                          ),
                        ),
                        Icon(
                          Icons.volume_up,
                          size: 40,
                          color: Color.fromARGB(255, 156, 35, 232),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/lis_bot2-r.png",
                    height: 100,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
