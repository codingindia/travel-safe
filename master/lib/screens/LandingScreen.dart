import 'package:flutter/material.dart';
import './BottomBar.dart';
import './alert.dart';
import './share.dart';


class LandingScreen extends StatelessWidget{
   @override
   Widget build(BuildContext context){

     AssetImage share =  AssetImage('assets/images/sharelogo.png');
      Image shareImage = Image(image: share);
    AssetImage alert =  AssetImage('assets/images/alertlogo.png');
      Image alertImage = Image(image: alert);
      return Container(
        color: Colors.white,
        padding:EdgeInsets.only(top:120.0),

        child: 
         Column(
           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
           children: <Widget>[

             GestureDetector(
               onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Share()),
                );
               },
               child: Expanded(
               child: Container(
                    child: shareImage,
                    height: 200.0,
                    width: 200.0,
                 )
               )
             ),

             GestureDetector(
               onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Alert()),
                );
               },
              
               child: Expanded(
                 child: Container(
                    child: alertImage,
                     height: 200.0,
                    width: 200.0,
                 )
               )
             ),
             
            
             Expanded(
              child: 
                Align(
                  alignment: FractionalOffset.bottomCenter,
                  child: Container(
                    child: BottomBar(),
                ),
                ),
                
               )
        ],)

        
      );
  }
   }