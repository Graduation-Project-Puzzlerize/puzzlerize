import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:puzzlerize/screens/login/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUp> {
  GlobalKey<ScaffoldState> scaffoldkey = new GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> performSignUp() async {
    String name = nameController.text;
    String email = emailController.text;
    String password = passwordController.text;

    // Check if the password length is 8 or more characters
    if (password.length >= 8) {
      // Check if the email is not already used
      if (!await isEmailUsed(email)) {
        // Check if the email is in a valid format
        if (isValidEmail(email)) {
          // Save the user's information to Firestore
          try {
            await FirebaseFirestore.instance.collection('mentors').add({
              'name': name,
              'email': email,
              'password': password,
            });

            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Sign up successful'),
              ),
            );

            // Navigate to the login screen
            navigateToLogin();
          } catch (error) {
            print('Error: $error');
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('An error occurred. Please try again.'),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Invalid email format'),
            ),
          );
        }
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

  Future<bool> isEmailUsed(String email) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection('mentors')
        .where('email', isEqualTo: email)
        .get();

    return querySnapshot.docs.isNotEmpty;
  }

  void navigateToLogin() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginScreen()),
    );
  }

  bool isValidEmail(String email) {
    return email.contains("@");
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
                controller: nameController,
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
                controller: emailController,
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
              TextFormField(
                controller: passwordController,
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
                  onPressed: performSignUp,
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
              Text("Already have an account?"),
              GestureDetector(
                onTap: navigateToLogin,
                child: Text(
                  "Log In",
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
