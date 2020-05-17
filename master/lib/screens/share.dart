import 'package:flutter/material.dart';
import './BottomBar.dart';

class Share extends StatefulWidget {
  @override
  _ShareState createState() => _ShareState();
}

class _ShareState extends State<Share> {
  @override
  Widget build(BuildContext context) {
        return Container(
      alignment: Alignment.center,
      color: Colors.white,
       child: Column(
         children: <Widget>[
           Text("This is Share Screens",
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
