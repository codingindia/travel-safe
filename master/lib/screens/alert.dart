import 'package:flutter/material.dart';
import './BottomBar.dart';

class Alert extends StatefulWidget {
  @override
  _AlertState createState() => _AlertState();
}

class _AlertState extends State<Alert> {
  @override
  Widget build(BuildContext context) {
        return Container(
      alignment: Alignment.center,
      color: Colors.white,
       child: Column(
         children: <Widget>[
           Text("This is alerts Screens",
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
