import 'package:flutter/material.dart';
import './BottomBar.dart';

class Group extends StatefulWidget {
  @override
  _GroupState createState() => _GroupState();
}

class _GroupState extends State<Group> {
  @override
  Widget build(BuildContext context) {
      return Container(
      alignment: Alignment.center,
      color: Colors.white,
       child: Column(
         children: <Widget>[
           Text("This is Groups Screens",
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
