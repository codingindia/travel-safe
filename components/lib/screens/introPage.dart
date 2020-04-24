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
            fontFamily: 'OpenSans'),
        marginTitle: EdgeInsets.only(left: 50.0, right: 50.0, top: 100.0, bottom:40.0),
        description: "Travel-safe simplifies safety for women in the digital world.",
        styleDescription:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 20.0,
            fontFamily: 'RobotoMono'),
        marginDescription: EdgeInsets.only(left: 50.0, right: 50.0, top: 40.0),
        pathImage: "images/safety.png",

        colorBegin: Color(0xfff14856),
        colorEnd: Color(0xffcb0073),
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
            fontFamily: 'OpenSans'),
        marginTitle: EdgeInsets.only(left: 50.0, right: 50.0, top: 100.0, bottom:40.0),
        description: "When travelling alone, stay alert and make use of technology.",
        styleDescription:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 20.0,
            fontFamily: 'RobotoMono'),
        marginDescription: EdgeInsets.only(left: 50.0, right: 50.0, top: 40.0),
        pathImage: "images/data.png",

        colorBegin: Color(0xffBA55D3),
        colorEnd: Color(0xff9932CC),
        directionColorBegin: Alignment.topRight,
        directionColorEnd: Alignment.bottomLeft,
      ),
    );
    slides.add(
      new Slide(
        title: "TRACKING",
        styleTitle:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'OpenSans'),
        marginTitle: EdgeInsets.only(left: 50.0, right: 50.0, top: 100.0, bottom:40.0),
        description:
        "User can create her own private group to share live location tracking.",
        styleDescription:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 20.0,
            fontFamily: 'RobotoMono'),
        marginDescription: EdgeInsets.only(left: 50.0, right: 50.0, top: 40.0),
        pathImage: "images/location.png",

        colorBegin: Color(0xff00FF00),
        colorEnd: Color(0xff32CD32),
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

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),


      // Dot indicator
//      colorDot: Color(0xff808080),
      colorActiveDot: Color(0xffB0C4DE),
      sizeDot: 13.0,
    );
  }
}
