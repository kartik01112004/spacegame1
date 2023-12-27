import './MyHomePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyAb7QlySSxbCVGYiCSYVLUP01ssl1rEbRY",
          appId: "1:408956506917:web:a3cb13a98f8a20bb0580cc",
          messagingSenderId: "408956506917",
          projectId: "login-page-3f87a"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const MyHomePage(),
    );
  }
}
