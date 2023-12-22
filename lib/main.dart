import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:practice/bloc/product/product_bloc.dart';
import 'package:practice/bloc/signinstate.dart';
import 'package:practice/firebase/product_firebase.dart';

import 'package:practice/pages/productpage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyDte7zV9zij43hI_oWO6UdKvrgGCiWmQDE",
      authDomain: "final-e9259.firebaseapp.com",
      projectId: "final-e9259",
      storageBucket: "final-e9259.appspot.com",
      messagingSenderId: "1060272536183",
      appId: "1:1060272536183:android:d8f4ad49aef0a1a7536472",
      measurementId: "G-FRETWF8BFR"
    ),
  //   const firebaseConfig = {
  // apiKey: "AIzaSyDte7zV9zij43hI_oWO6UdKvrgGCiWmQDE",
  // authDomain: "final-e9259.firebaseapp.com",
  // projectId: "final-e9259",
  // storageBucket: "final-e9259.appspot.com",
  // messagingSenderId: "1060272536183",
  // appId: "1:1060272536183:web:6cedea283679241c536472",
  // measurementId: "G-FRETWF8BFR"
// };
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(
      create: (context) => SignInCubit(),
      child: MyApp(),
    ),
        // BlocProvider<TodoBloc>(
        //   create: (BuildContext context) => TodoBloc(FirestoreService()),
        // ),
        BlocProvider<ProductBloc>(
          create: (BuildContext context) => ProductBloc(ProductFirestoreService()),
        ),
        
      ],
      child: MaterialApp(
        home: ProductView(),
      ),
    );
  }
}


class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final signInCubit = BlocProvider.of<SignInCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Email",
                hintText: "Enter your email",
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: passwordController,
              obscureText: true, // Hide the password input
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Password",
                hintText: "Enter your password",
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => signIn(context),
              child: Text("Sign In"),
            ),
          ],
        ),
      ),
    );
  }

  void signIn(BuildContext context) {
    final signInCubit = BlocProvider.of<SignInCubit>(context);

    signInCubit.signIn(
      emailController.text,
      passwordController.text,
    );

    // Route to Home page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ProductView()),
    );
  }
}

