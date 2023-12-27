import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
class RESULT extends StatelessWidget {
  const RESULT({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('YOUR APP'),
        centerTitle: true,
      ),
      body:Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                final snackBar = SnackBar(
                  content: const Text('i am a snackbar'),
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              },
              child: const Text('Show SnackBar'),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(context: context, builder:(context){
                  return Container(
                    child: AlertDialog(
                      title: Text('i am demo'),
                      actions: [
                        TextButton(onPressed:(
                            ) {
                          Navigator.pop(context);
                        }, child: Text("ok"))
                      ],
                    ),
                  );
                });
              },
              child: const Text('Show dialog box'),
            ),
            ElevatedButton(onPressed: () async{
              await FirebaseAuth.instance.signOut();
            }, child: Text("log out"))
          ],
        ),
      )

    );
  }
}
