import 'package:flutter/material.dart';
import 'package:travelsafe/panicButton.dart';
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
          title: new Text("Flutter Demo Home Page"),
          automaticallyImplyLeading: false
      ),
      body: new Center(

        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
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