import 'package:flutter/material.dart';
import 'package:travelsafe/panicButton.dart';
import 'package:travelsafe/screens/shared_location.dart';
import 'package:travelsafe/screens/maps.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share/share.dart';
import 'package:travelsafe/screens/register.dart';
import 'package:travelsafe/screens/login.dart';
import 'package:travelsafe/screens/introPage.dart';


void main() {
  runApp(new MaterialApp(
    home: new MyIntroPage(),
  ));
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return new SplashScreen(
      seconds: 14,
      navigateAfterSeconds: new MyHomePage(),
      title: new Text(
        'Welcome To Travel Safe',
        style: new TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20.0
        ),
      ),
      image: new Image.network('https://i.imgur.com/TyCSG9A.png'),
      backgroundColor: Colors.white,
      styleTextUnderTheLoader: new TextStyle(),
      photoSize: 100.0,
      onClick: () => print("Flutter Splash Screen"),
      loaderColor: Colors.red
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final Geolocator geolocator = Geolocator()
    ..forceAndroidLocationManager;
  Position _currentPosition;


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Travel Safe"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.map
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context)=>SharedLocation()));
          },
        ),
      ),
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            PanicButton(),
            FlatButton(
              padding: EdgeInsets.all(8.0),
              splashColor: Colors.blueAccent,
              color: Colors.blue,
              textColor: Colors.white,
              child: Text("Share Location"),
              onPressed: () {
                //get the current location when flat button is pressed
                _getCurrentLocation();
                //share latitude and longitude in map to other applications on the device
                _shareMap();
              },
            ),
            RaisedButton(
                child: Text("Register"),
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>RegisterPage()
                    )
                  );
                }
            ),
            RaisedButton(
                child: Text("Login"),
                color: Colors.blue,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                onPressed: (){
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context)=>LoginPage()
                    )
                  );
                }
            ),
          ],
        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (BuildContext context) => AnimateCamera(13.0, 77.0)));
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // This method/function gets the current user location
  _getCurrentLocation() {
    geolocator
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.best)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }

  // This method/function share the current user location in map view given all application on the
  // the device that allows sharing
  _shareMap() {
    final RenderBox box = context.findRenderObject();
    Share.share(
        'https://www.google.com/maps/search/?api=1&query=${_currentPosition
            .latitude},${_currentPosition.longitude}',
        sharePositionOrigin:
        box.localToGlobal(Offset.zero) &
        box.size);
  }

}