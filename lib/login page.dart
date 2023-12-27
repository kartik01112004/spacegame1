import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'auth_service.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        // Use the FaIcon Widget + FontAwesomeIcons class for the IconData
        icon: const FaIcon(FontAwesomeIcons.hammer),
        color: Colors.grey[700],
        onPressed: () {});
  }
}

class LOGINPAGE extends StatefulWidget {
  const LOGINPAGE({Key? key}) : super(key: key);

  @override
  State<LOGINPAGE> createState() => _LOGINPAGEState();
}

class _LOGINPAGEState extends State<LOGINPAGE> {
  final _formKey = GlobalKey<FormState>();
  final _emailaddress = TextEditingController();
  final _password = TextEditingController();
  final _fullname = TextEditingController();

  String email = '';
  String password = '';
  String fullname = '';
  bool login = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text("LOGIN PAGE"),
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          children: [
            const MyWidget(),
            ListTile(
              title: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailaddress,
                decoration: InputDecoration(
                  hintText: "Enter email address",
                  icon: const Icon(Icons.mail_outlined),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return 'Enter a valid email!';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    email = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _password,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Enter user pasword",
                  icon: const Icon(FontAwesomeIcons.lock),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                onSaved: (value) {
                  setState(() {
                    password = value!;
                  });
                },
              ),
            ),
            ListTile(
              title: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _fullname,
                decoration: InputDecoration(
                  hintText: "Enter user Name",
                  icon: const Icon(FontAwesomeIcons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                    borderSide: const BorderSide(),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter user name';
                  }
                  return null;
                },
                onSaved: (value) {
                  setState(() {
                    fullname = value!;
                  });
                },
              ),
            ),
            // ListTile(
            //   title: TextButton(
            //       onPressed: () {
            //         var route = MaterialPageRoute(
            //             builder: (context) =>
            //                 NEXTPAGE(value: _emailaddress.text));
            //         Navigator.of(context).push(route);
            //       },
            //       child: const Text(
            //         'fogot pasword?',
            //         style: TextStyle(color: Colors.black),
            //       )),
            // ),
            ListTile(
              title: Container(
                height: 55,
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        login
                            ? AuthServices.signinUser(email, password, context)
                            : AuthServices.signupUser(
                                email, password, fullname, context);
                      }
                    },
                    child: Text(login ? 'Login' : 'Signup')),
              ),
            ),
            ListTile(
              title: TextButton(
                  onPressed: () {
                    setState(() {
                      login = !login;
                    });
                  },
                  child: Text(login
                      ? "Don't have an account? Signup"
                      : "Already have an account? Login")),
            )
          ],
        ),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
//
// class UserFromScreen extends StatefulWidget {
//   const UserFromScreen({Key? key}) : super(key: key);
//
//   @override
//   State<UserFromScreen> createState() => _UserFromScreenState();
// }
//
// class _UserFromScreenState extends State<UserFromScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   final TextEditingController userName = TextEditingController();
//   final TextEditingController password = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text("User From"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(10.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               const Text("User Name"),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 // keyboardType: TextInputType.number,
//                 // maxLength: 10,
//                 controller: userName,
//                 decoration: InputDecoration(
//                   hintText: "Enter User Name",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: const BorderSide(),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter user name';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               TextFormField(
//                 obscureText: true,
//                 controller: password,
//                 decoration: InputDecoration(
//                   hintText: "Enter User Password",
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                     borderSide: const BorderSide(),
//                   ),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter user Password';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(
//                 height: 10,
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     print("Validated");
//
//                     print(
//                         " User Name ${userName.text}, Password ${password.text}");
//
//                     Map userRequiredData = {
//                       "user_name": userName.text,
//                       "password": password.text
//                     };
//
//                     print(userRequiredData);
//                   } else {
//                     print("Not Validated");
//                   }
//                 },
//                 child: const Text('Submit'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
