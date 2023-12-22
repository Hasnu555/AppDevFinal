
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      User? user = userCredential.user;
      if (user != null) {
        print("Signed up: ${user.email}");
        // You can navigate to another page or perform other actions here
      } else {
        print("User is null");
      }
    } catch (e) {
      print("Error signing up: $e");
      // Handle sign-up errors here
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: "Email",
                hintText: "Enter your email",
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: true, // Hide the password input
              decoration: InputDecoration(
                labelText: "Password",
                hintText: "Enter your password",
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: signUp,
              child: Text("Sign Up"),
            ),
          ],
        ),
      ),
    );
  }
}