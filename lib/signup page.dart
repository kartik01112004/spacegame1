import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'login page.dart';

class SIGNUPPAGE extends StatefulWidget {
  const SIGNUPPAGE({Key? key}) : super(key: key);

  @override
  State<SIGNUPPAGE> createState() => _SIGNUPPAGEState();
}

class _SIGNUPPAGEState extends State<SIGNUPPAGE> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailaddress = TextEditingController();
  final TextEditingController phonenumber = TextEditingController();
  final TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('SIGN UP PAGE'),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            MyWidget(),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: emailaddress,
              decoration: InputDecoration(
                hintText: "Enter email address",
                icon: const Icon(Icons.mail_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(),
                ),
              ),
              onFieldSubmitted: (value) {
                //Validator
              },
              validator: (value) {
                if (value!.isEmpty ||
                    !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                  return 'Enter a valid email!';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              maxLength: 10,
              controller: phonenumber,
              decoration: InputDecoration(
                hintText: "Enter phone number",
                icon: const Icon(Icons.account_circle_outlined),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter phone number';
                }
                return null;
              },
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: password,
              decoration: InputDecoration(
                hintText: "Enter user password",
                icon: const Icon(FontAwesomeIcons.lock),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(),
                ),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter user password';
                }
                return null;
              },
            ),
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => LOGINPAGE()));
                  const SnackBar(
                    content: Text('going to login page'),
                  );
                } else {
                  SnackBar(content: Text('invalid'));
                }
              },
              child: const Text('Return to login '),
            ),
          ],
        ),
      ),
    );
  }
}
