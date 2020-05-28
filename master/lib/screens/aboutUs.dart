import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  bool need = false, mission = false, working = false, contributors = false;
  
  
  Widget _displayLogo(){
    String content = "Travel-safe simplifies safety for women in the digital world.";
    return Container(
      padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                  padding: EdgeInsets.all(30),
                  alignment: Alignment.center,
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fill, 
                    image: AssetImage("assets/images/travelsafelogo.png")),
                ),
              ),
            ),
          Container(
      padding: EdgeInsets.all(15),
      child: RichText(
        text: TextSpan(
          text: content,
          style: TextStyle(
            fontSize: 15,
          wordSpacing: 5,
          height: 1.5,
          color: Colors.black,
          ),
        ),
      ),
      )
        ],
      )
    );
  }

  Widget getNeedWidget(){
    String content = "Being Concerned with the increasing brutality and insecurities faced by women during their travel, Despite of many Safety apps, none of them properly solves this problem.Travel Safe- A Flutter Application will help in preventing such instances and will promote safe and secure travel.If you think that your notable tech skills can help women of our country travel safely, Please be a part of Travel Safe and join our mission to make the world a safer place.";
    return Container(
      padding: EdgeInsets.all(15),
      child: RichText(
        text: TextSpan(
          text: content,
          style: TextStyle(
            fontSize: 13,
          wordSpacing: 5,
          height: 1.5,
          color: Colors.black,
          ),
        ),
      ),
      );
  }

  Widget getMissionWidget(){
    String content = "Our mission is to help women to be safe using technology. We aim to reach out to as many women as possible and be their courage.";
    return Container(
      padding: EdgeInsets.all(15),
      child: RichText(
        text: TextSpan(
          text: content,
          style: TextStyle(
            fontSize: 13,
          wordSpacing: 5,
          height: 1.5,
          color: Colors.black,
          ),
        ),
      ),
      );
  }

  Widget getWorkingWidget(){
    String content = "Share live location with a friend or in a group.Use the Panic Button to send the alarm to all the people with whom locations is being shared. Stop sharing location when you think you are safe";
    return Container(
      padding: EdgeInsets.all(15),
      child: RichText(
        text: TextSpan(
          text: content,
          style: TextStyle(
            fontSize: 13,
          wordSpacing: 5,
          height: 1.5,
          color: Colors.black,
          ),
        ),
      ),
      );
  }

  
  
  Widget _card(String text){
    return GestureDetector(
      onTap: (){
        setState(() {
          if (text == "Need for TRAVEL SAFE"){
            this.need = !this.need;
          }
          else if(text == "Our Mission"){
            this.mission = !this.mission;
          }
          else if(text == "How does it work?"){
            this.working = !this.working;
          }
          else{
            this.contributors = !this.contributors;
          }
        });
      },
      child: Padding(
      padding: EdgeInsets.all(5),
      child: Card(
        elevation: 3,
        child: InkWell(
          child: Container(
          padding: EdgeInsets.all(16),
          width: 650,
          height: 80,
          child: Row(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            
            ),
          ],
        ),
        ),
        ),
    ),
    ),
    ); 
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Travel-safe"),
        backgroundColor: Colors.lightBlue,
      ),
      body: SingleChildScrollView(
            child: Column(children: <Widget>[
               _displayLogo(),
              SizedBox(height: 20),
              _card("Need for TRAVEL SAFE"),
              this.need?
                    getNeedWidget():Container(),
              _card("Our Mission"),
              this.mission?getMissionWidget():Container(),
              _card("How does it work?"),
              this.working?getWorkingWidget():Container(),
              _card("Our Contributors"),
              this.contributors?StreamBuilder<QuerySnapshot>(
                  stream: Firestore.instance.collection("contributors").snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snap){
                    if(snap.hasError){
                      return Text("Error: ${snap.error}");
                    }
                    switch (snap.connectionState) {
                      case ConnectionState.waiting:return Text("Loading ...");
                      default: 
                      return GridView.count(
                        shrinkWrap: true,
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        padding: EdgeInsets.all(2.0),
                        children: snap.data.documents.map((DocumentSnapshot document){
                            return Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                  children: <Widget>[
                                    Padding(padding: EdgeInsets.all(5),
                                      child: CircularProfileAvatar(
                                      document["profilepic"],
                                      radius: 35,
                                      backgroundColor: Colors.transparent,
                                      elevation: 5,
                                      cacheImage: true,
                                      onTap: (){
                                        launch(document["github"]);
                                      },
                                    ),
                                    ),   
                                    Text(document["name"]),
                                  ],
                                )
                            );
                        }
                        ).toList(),
                      ); 
                      break;
                    }
                  }
                ):Container()
            ]),
      ),
    );
  }
}