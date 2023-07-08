import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ready extends StatelessWidget {
  const ready({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 80,
              ),
              Image.asset(
                "assets/images/are_you_ready.PNG",
                width: 500,
              ),
              SizedBox(
                height: 130,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                      child: Image.asset(
                        'assets/images/no1.PNG',
                        fit: BoxFit.fill,
                        height: 150,
                      ),
                      flex: 1),
                  Expanded(
                      child: Image.asset(
                        'assets/images/no2.PNG',
                        fit: BoxFit.fill,
                        height: 150,
                      ),
                      flex: 1),
                  Expanded(
                      child: Image.asset(
                        'assets/images/no3.PNG',
                        fit: BoxFit.fill,
                        height: 150,
                      ),
                      flex: 1),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
