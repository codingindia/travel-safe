

import 'package:flutter/material.dart';
import './LandingScreen.dart';
import './track.dart';
import './group.dart';

class BottomBar extends StatelessWidget{
  @override
   Widget build(BuildContext context){
     AssetImage assetimg =  AssetImage('assets/images/home.png');
      Image image = Image(image: assetimg);
      return Container(
        decoration: outerBoxDecoration(), 
        child: Row(
           children: <Widget>[
               Expanded(
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Track()),
                      );
                    },
                    child: Text("Track",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                    decoration: TextDecoration.none,
                   fontSize: 25.0,
                   color: Colors.black,
                   fontWeight: FontWeight.w700,
                 ),
                ),
             ),
             ),
            
              Expanded(
                child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LandingScreen()),
                      );
                    },
                child: Container(
                child: image,
                height: 70.0,
                width: 70.0,
                decoration: homeBoxDecoration(), 
                ) ,
             ),
             ),

              Expanded(
                 child: GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Group()),
                      );
                    },
                child:  Text("Groups",
                 textAlign: TextAlign.center,
                 style: TextStyle(
                  decoration: TextDecoration.none,
                   fontSize: 25.0,
                   color: Colors.black,
                   fontWeight: FontWeight.w700
                 ),
                 ) 
            )
              ),
     ],
     )
     );
   }
}

BoxDecoration homeBoxDecoration() {
  return BoxDecoration(
    border: Border(
      left: 
      BorderSide( //                   <--- left side
          color: Colors.grey[400],
          width: 7.0,
        ),
      right: 
      BorderSide( //                   <--- left side
          color: Colors.grey[400],
          width: 7.0,
        ),
    ),
  );
}

BoxDecoration outerBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
      width:7.0,
      color: Colors.grey[400],
    ),
  );
}