import 'package:firebase/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  FirebaseAuth instance = FirebaseAuth.instance; //server auth db
  @override
  void initState() {
    super.initState();
    instance.authStateChanges().listen((User user) {
      if (user == null) {
        //print('no user');
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Login()));
      } else {
        //print('there is a user');

      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                instance.signOut();
              }),
        ],
      ),
      body: Center(
        child: Text('Home Screen'),
      ),
    );
  }
}
