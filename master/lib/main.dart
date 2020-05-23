import 'package:flutter/material.dart';
import './screens/BottomBar.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel safe',
      home: Scaffold(
        // appBar: AppBar(title: Text("This is my frst screen"),),
        body:  BottomBar()
      )
  );
  }
}
