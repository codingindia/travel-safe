import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travelsafe/main.dart';

class Home extends StatefulWidget {
  Home({Key key, this.title}):
  super(key: key);

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  FirebaseAuth auth = FirebaseAuth.instance;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              child: Text("Logout",
                style: TextStyle(fontSize: 20),
              ),
              elevation: 10,
              color: Colors.white,
              textColor: Colors.indigo,
              onPressed: () async{
              await auth.signOut();
              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage()));
            })
          ],),
      ),
    );
  }
}