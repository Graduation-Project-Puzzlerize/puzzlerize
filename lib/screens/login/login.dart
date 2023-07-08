import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puzzlerize/screens/signup/signup.dart';
import 'package:puzzlerize/screens/my_games/my_games.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:puzzlerize/services/database.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> performLogin() async {
    String enteredEmail = emailController.text;
    String enteredPassword = passwordController.text;

    if (isValidEmail(enteredEmail)) {
      try {
        if (await DatabaseMethods()
            .checkCredentials(enteredEmail, enteredPassword)) {
          // Login successful
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Login successful'),
            ),
          );

          // Navigate to the UserData screen and pass the retrieved user data
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => myGames(),
            ),
          );
        } else {
          // Incorrect email or password
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Incorrect email or password'),
            ),
          );
        }
      } catch (error) {
        print('Error: $error');
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('An error occurred. Please try again.'),
          ),
        );
      }
    } else {
      // Invalid email format
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid email format'),
        ),
      );
    }
  }

  bool isValidEmail(String email) {
    return email.contains("@");
  }

  void navigateToSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
    );
  }

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
                image: AssetImage('assets/images/logo.png'),
                height: 100,
                width: 200,
              ),
              Image(
                image: AssetImage('assets/images/2.png'),
                height: 200,
                width: 200,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
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
              SizedBox(height: 20), // add some space between the text fields
              TextFormField(
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                controller: passwordController,
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
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: performLogin, // Call the performLogin method
                  child: Text(
                    "Log In",
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
              SizedBox(height: 10),
              Text("Don't have an account?"),
              GestureDetector(
                onTap: navigateToSignUp,
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
