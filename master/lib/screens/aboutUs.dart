import 'package:flutter/material.dart';

class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  bool need = false, mission = false, working = false, contributors = false;
  
  Widget _displayLogo(){
    return Container(
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
          Padding(
            padding: EdgeInsets.symmetric(),
            child: Text("Travel-safe simplifies safety for women in the digital world."),
          ),
        ],
      )
    );
  }

  Widget getNeedWidget(){
    return Container(child: Text("Need"),);
  }

  Widget getMissionWidget(){
    return Container(child: Text("mission"),);
  }

  Widget getWorkingWidget(){
    return Container(child: Text("working"),);
  }

  Widget getContributorsWidget(){
    return Container(
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
            ],
          ),
        ],
      ), 
    );
  }

  
  Widget _card(String text){
    return GestureDetector(
      onTap: (){
        setState(() {
          if (text == "need"){
            this.need = !this.need;
          }
          else if(text == "mission"){
            this.mission = !this.mission;
          }
          else if(text == "working"){
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
          padding: EdgeInsets.all(20),
          width: 450,
          height: 60,
          child: Row(
          children: <Widget>[
            Text(
              text,
              style: TextStyle(
                fontSize: 17,
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
        title: Text("TRAVEL SAFE"),
        backgroundColor: Colors.pinkAccent,
      ),
      body: Container(
        child: Column(children: <Widget>[
          _displayLogo(),
          SizedBox(height: 20),
          _card("need"),
          this.need?
          getNeedWidget():Container(),
          _card("mission"),
          this.mission?getMissionWidget():Container(),
          _card("working"),
          this.working?getWorkingWidget():Container(),
          _card("contributors"),
          this.contributors?getContributorsWidget():Container(),
          // _ourMission(),
          // _contributors(),
        ],)
      ),
    );
  }
}