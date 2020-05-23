import 'package:flutter/material.dart';

void main() => runApp(Track());

class Track extends StatefulWidget {
  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[Center(child: Text('Track Page'))],
      ),
    ));
  }
}
