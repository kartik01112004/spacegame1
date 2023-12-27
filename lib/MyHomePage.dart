import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'login.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/1a41ec3f12b4d5165d46168bd952117d.gif'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 50.0),
                child: Text(
                  "Let's go on a tour of the space!!!",
                  style: TextStyle(fontWeight: FontWeight.bold,
                    fontSize: 30.0,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 250.0),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => login());
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  backgroundColor: const Color.fromARGB(255, 2, 29, 51),
                ),
                child: Container(
                  width: 200.0,
                  height: 50.0,
                  child: Center(
                    child: Text("Play now"),
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
