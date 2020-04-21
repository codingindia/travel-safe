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
            fontFamily: 'RobotoMono'),
        description: "Travel-safe simplifies safety for women in the digital world by"
            "making it easy to stay connected to the nearest police station.",
        styleDescription:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/women_safe.png",
        backgroundColor: Color(0xffD02090),
      ),
    );
    slides.add(
      new Slide(
        title: "TECHNOLOGY",
        styleTitle:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description: "When travelling alone, it's best to raise your guards, stay alert and make"
            "use of the technology that entertains you and lies comfortably in your purse - your"
            "mobile phone, for your safety.",
        styleDescription:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/security.jpeg",
        backgroundColor: Color(0xff009981),
      ),
    );
    slides.add(
      new Slide(
        title: "REAL TIME TRACKING",
        styleTitle:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 30.0,
            fontWeight: FontWeight.bold,
            fontFamily: 'RobotoMono'),
        description:
        "Travel-safe: - user can create her own private group to share live location tracking "
            "whenever switched on. When the user decides to share her location, the nearest "
            "police station also gets a regular update on  it.",
        styleDescription:
        TextStyle(color: Color(0xffFFFFFF),
            fontSize: 20.0,
            fontStyle: FontStyle.italic,
            fontFamily: 'Raleway'),
        pathImage: "images/safety.png",
        backgroundColor: Color(0xff101EBC),
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
      colorSkipBtn: Color(0x33000000),
      highlightColorSkipBtn: Color(0xff000000),

      // Next, Done button
      onDonePress: this.onDonePress,
      renderNextBtn: this.renderNextBtn(),
      renderDoneBtn: this.renderDoneBtn(),
      colorDoneBtn: Color(0x33000000),
      highlightColorDoneBtn: Color(0xff000000),

      // Dot indicator
      colorDot: Color(0x33D02090),
      colorActiveDot: Color(0xffD02090),
      sizeDot: 13.0,
    );
  }
}
