import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
import 'package:travelsafe/screens/register.dart';

class MyIntroPage extends StatefulWidget {
  @override
  _MyIntroPage createState() => _MyIntroPage();
}

class _MyIntroPage extends State<MyIntroPage> {
  List<Slide> slides = new List();

  @override
  void initState() {
    super.initState();

    slides.add(
      new Slide(
        title: "WOMEN SAFETY",
        styleTitle:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'SansSerif'),
        description: "Travel-safe simplifies safety for women in the digital world.",
        styleDescription:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 20.0,
            fontFamily: 'Roboto'),
        pathImage: "images/safety.png",

        colorBegin: Color(0xffFF00FF),
        colorEnd: Color(0xffD02090),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,

      ),
    );
    slides.add(
      new Slide(
        title: "TECHNOLOGY",
        styleTitle:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'San'),
        description: "When travelling alone, stay alert and make use of technology.",
        styleDescription:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 20.0,
            fontFamily: 'Roboto'),
        pathImage: "images/phone.png",

        colorBegin: Color(0xff48D1CC),
        colorEnd: Color(0xff009981),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "REAL TIME TRACKING",
        styleTitle:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'San'),
        description:
        "User can create her own private group to share live location tracking.",
        styleDescription:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 20.0,
            fontFamily: 'Roboto'),
        pathImage: "images/tracking.png",

        colorBegin: Color(0xff4169E1),
        colorEnd: Color(0xff101EBC),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
  }

  void onDonePress() {
    // go to next screen
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  void onSkipPress() {
    // skip the intro screen
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => RegisterPage()));
  }

  Widget renderNextBtn() {

  }

  Widget renderDoneBtn() {
//    return Text(
//      text: "GOT IT",
//      color: Color(0xffD02090),
//    );
//    return Icon(
//      Icons.done,
//      color: Color(0xffD02090),
//    );
  }

  Widget renderSkipBtn() {

  }

  @override
  Widget build(BuildContext context) {
    return new IntroSlider(
      // List slides
      slides: this.slides,

      // Skip button
      renderSkipBtn: this.renderSkipBtn(),
      onSkipPress: this.onSkipPress,
//      colorSkipBtn: Color(0x33000000),
//      highlightColorSkipBtn: Color(0xff000000),

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
//      colorDoneBtn: Color(0x33000000),
//      highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: Color(0xffFFFDDD),
      colorActiveDot: Color(0xffD08111),
      sizeDot: 13.0,
    );
  }
}
