import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:travelsafe/screens/introPage.dart';


void main() {
  runApp(new MaterialApp(
    home: new MyApp(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // Start splash screen
    return new SplashScreen(
        seconds: 14,
        navigateAfterSeconds: new MyIntroPage(),
        title: new Text('Welcome To Travel Safe',
          style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0
          ),),
        image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        photoSize: 100.0,
        onClick: () => print("Flutter Splash Screen"),
        loaderColor: Colors.red
    );
  }
}


