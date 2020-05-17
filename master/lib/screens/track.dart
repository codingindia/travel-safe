import 'package:flutter/material.dart';
import './BottomBar.dart';

class Track extends StatefulWidget {
  @override
  _TrackState createState() => _TrackState();
}

class _TrackState extends State<Track> {
  @override
  Widget build(BuildContext context) {
        return Container(
      alignment: Alignment.center,
      color: Colors.white,
       child: Column(
         children: <Widget>[
           Text("This is Tracks Screens",
           style: TextStyle(
          decoration: TextDecoration.none
         )
        ),


          Expanded(
              child: Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: BottomBar(),
                ),
                ),
            ),
       ],
      )
    );
  
  
  }
}
