import 'package:flutter/material.dart';
import './BottomBar.dart';

class CommonScreen extends StatelessWidget{
  @override
   Widget build(BuildContext context){
      return Container(
      alignment: Alignment.center,
      color: Colors.white,
       child: Column(
         children: <Widget>[
           Text("This is coming soon",
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