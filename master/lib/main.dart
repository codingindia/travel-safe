import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:travelsafe/panicButton.dart';
import 'package:travelsafe/screens/shared_location.dart';
import 'package:travelsafe/screens/maps.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share/share.dart';
import 'package:travelsafe/screens/register.dart';
import 'package:travelsafe/screens/login.dart';
import 'package:travelsafe/screens/introPage.dart';
import 'package:travelsafe/screens/group.dart';
import 'package:travelsafe/screens/track.dart';

class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Track()),
        );
      }
      if (index == 1) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => main()),
        );
      }
      if (index == 2) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Group()),
        );
      }
    });
  }

Widget _displayalertlogo(){
      return Container(
            
            //padding: EdgeInsets.all(150),
            alignment: Alignment.center,
            height: 190,
            width: 190,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.fill, 
                image: AssetImage("assets/images/alertlogo.png")),
            ),
          );
  }
  Widget _displaysharelogo(){
      return Container(
            
            //padding: EdgeInsets.all(150),
            alignment: Alignment.center,
            height: 190,
            width: 190,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              image: DecorationImage(
                alignment: Alignment.topCenter,
                fit: BoxFit.fill, 
                image: AssetImage("assets/images/sharelogo.png")),
            ),
          );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Travel Safe'),
        backgroundColor: Colors.blueAccent,
        actions: <Widget>[
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: ListView(
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.bookmark_border,
              color: Colors.black54,
            ),
            title: Text(
              'Track',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black54,
            ),
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.group,
              color: Colors.black54,
            ),
            title: Text(
              'Group',
              style: TextStyle(
                color: Colors.black54,
              ),
            ),
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
