import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puzzlerize/screens/login/login.dart';
import 'package:puzzlerize/screens/user_data/user_data.dart';
import 'package:flutter/painting.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUp> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void performSignUp() {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // Check if the password length is 8 or more characters
    if (password.length >= 8) {
      // Check if the email is not already used
      if (!isEmailUsed(email)) {
        // Save the user's information and show a success message
        saveUser(name, email, password);

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Sign up successful'),
          ),
        );

        // Navigate to the login screen
        navigateToLogin();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Email is already in use'),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password should be 8 or more characters'),
        ),
      );
    }
  }

  bool isEmailUsed(String email) {
    return usedEmails.any((user) => user['email'] == email);
  }

  void saveUser(String name, String email, String password) {
    usedEmails.add({
      'name': name,
      'email': email,
      'password': password,
    });
  }

  void navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
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
                height: 50,
                width: 200,
              ),
              Image(
                image: AssetImage('assets/images/2.png'),
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
              SizedBox(height: 10),
              Text("Don't have an account?"),
              GestureDetector(
                onTap: navigateToLogin,
                child: Text(
                  "Log In",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20,
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
