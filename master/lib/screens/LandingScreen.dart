import 'package:flutter/material.dart';
import 'package:travelsafe/screens/alert.dart';
import 'package:travelsafe/screens/share.dart';

void main() => runApp(LandingScreen());

class LandingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    AssetImage share = AssetImage('assets/images/updatedsharelogo.png');
    Image shareImage = Image(image: share);
    AssetImage alert = AssetImage('assets/images/updatedalertlogo.png');
    Image alertImage = Image(image: alert);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                height: 150.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Share()));
                  },
                  child: Image(
                    image: AssetImage('assets/images/updatedsharelogo.png'),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Container(
                height: 150.0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Alert()));
                  },
                  child: Image(
                    image: AssetImage('assets/images/updatedalertlogo.png'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
