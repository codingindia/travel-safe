import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share/share.dart';

class MyHomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyHomePage> {
  final Geolocator geolocator = Geolocator()..forceAndroidLocationManager;
  Position _currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Your Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
//            if (_currentPosition != null)
//              Text(
//                  "Latitide: ${_currentPosition.latitude} & Longitude: ${_currentPosition.longitude}"),
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
          ],
        ),
      ),
    );
  }

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

  _shareText() {
    final RenderBox box = context.findRenderObject();
    Share.share(
        'Latitide: ${_currentPosition.latitude} & Longitude: ${_currentPosition.longitude}',
        sharePositionOrigin:
        box.localToGlobal(Offset.zero) &
        box.size);
  }

  _shareMap() {
    final RenderBox box = context.findRenderObject();
    Share.share(
        'https://www.google.com/maps/search/?api=1&query=${_currentPosition.latitude},${_currentPosition.longitude}',
        sharePositionOrigin:
        box.localToGlobal(Offset.zero) &
        box.size);
  }
}
