import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class PanicButton extends StatefulWidget {
  @override
  _PanicButtonState createState() => _PanicButtonState();
}

class _PanicButtonState extends State<PanicButton> {
  int _counter = 0;

  // this widget will count the number of times the button get pressed and further do the work
  _incrementCounter() {
    // incrimenting the count as the button get pressed
    setState(() {
      _counter++;
    });
    // as stated by the mentors, we have to create a triple pressed button for storing the alert message
    if (_counter == 3) {
      // creating instance of Firestore to store the data in 'panicButton' database in firebase
      Firestore.instance.collection('/panicButton').add({'data': "Panic"}).catchError((e) {
        // used to print errors, if occurs any
        print(e);
      });
      // after the work is done, set the counter back to 0
      setState(() {
        _counter = 0;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // setting width of the button
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          RaisedButton(
            // adding color in button
            color: Colors.blueAccent,
            // calls the _incrementCounter widget which counts the no of times the button is pressed, and perform the work mentioned
            onPressed: _incrementCounter, 
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              // adding text inside the button
              child: Text(
                "Panic Button",
                // styling of text inside the button
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}