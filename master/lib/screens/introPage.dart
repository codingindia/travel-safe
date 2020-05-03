import 'package:flutter/material.dart';
import 'package:travelsafe/screens/register.dart';
import 'package:travelsafe/screens/login.dart';
import 'package:carousel_slider/carousel_slider.dart';


var color1 = Color(0xfff14856);
var color1b = Color(0xffcb0073);
var color2 = Color(0xffa6882c);
var color2b = Color(0xff534416);
var color3 = Color(0xff00FF00);
var color3b = Color(0xff129314);


List<String> image = [
  'assets/images/safety.png',
  'assets/images/technology.png',
  'assets/images/location.png'
];

List<String> title = [
  'WOMEN SAFETY',
  'TECHNOLOGY',
  'TRACKING',
];

List<String> text = [
  'Travel-safe simplifies safety for women in the digital world.',
  'When travelling alone, stay alert and make use of technology.',
  'User can create her own private group to share live location tracking.'
];

class MyIntroPage extends StatefulWidget {
  @override
  _MyIntroPage createState() => _MyIntroPage();
}

class _MyIntroPage extends State<MyIntroPage> {
  CarouselSlider carouselSlider;
  int carouselIndex = 0;

  @override
  Widget build(BuildContext context) {
    carouselSlider = CarouselSlider(
      viewportFraction: 1.0,
      enableInfiniteScroll: false,
      onPageChanged: (index) {
        setState(() {
          carouselIndex = index;
        });
      },
      height: MediaQuery
          .of(context)
          .size
          .height,
      items: <Widget>[
        CarouselComponent(
          col1: color1,
          col2: color1b,
          imgUrl: image[0],
          ttl: title[0],
          txt: text[0],
        ),
        CarouselComponent(
          col1: color2,
          col2: color2b,
          imgUrl: image[1],
          ttl: title[1],
          txt: text[1],
        ),
        CarouselComponent(
          col1: color3,
          col2: color3b,
          imgUrl: image[2],
          ttl: title[2],
          txt: text[2],
        ),
      ],
    );

    return Scaffold(
      floatingActionButton: carouselIndex == 2
          ? Container()
          : Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.bottomLeft,
            child: FlatButton(
              onPressed: () {
                carouselSlider.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              child: Container(
                margin: const EdgeInsets.only(left: 30.0),
                child: Text(
                  'SKIP',
                  style: TextStyle(
                      color: Color(0xFFffffff),
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FlatButton(
              onPressed: () {
                carouselSlider.nextPage(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.ease);
              },
              child: Text(
                'NEXT',
                style: TextStyle(
                    color: Color(0xFFffffff),
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          carouselSlider,
          carouselIndex == 2
              ? Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: FlatButton(
                    onPressed: () {
                      navigateToLoginPage(context);
                    },
                    child: Text(
                      'LOGIN',
                      style: TextStyle(
                          color: Color(0xFFffffff),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Container(
                  margin: const EdgeInsets.only(bottom: 10.0),
                  child: FlatButton(
                    onPressed: () {
                      navigateToRegisterPage(context);
                    },
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                          color: Color(0xFFffffff),
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ],
          )
              : Positioned(
            bottom: 30,
            child: Row(
              children: <Widget>[
                Indicator(
                  carouselIndex: carouselIndex,
                  indicatorIndex: 0,
                ),
                Indicator(
                  carouselIndex: carouselIndex,
                  indicatorIndex: 1,
                ),
                Indicator(
                  carouselIndex: carouselIndex,
                  indicatorIndex: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Future navigateToRegisterPage(context) async {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => RegisterPage()));
}

Future navigateToLoginPage(context) async {
  Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (context) => LoginPage()));
}

class CarouselComponent extends StatelessWidget {
  final col1, col2, imgUrl, ttl, txt;

  CarouselComponent({this.col1, this.col2, this.imgUrl, this.ttl, this.txt});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery
          .of(context)
          .size
          .width,
      height: MediaQuery
          .of(context)
          .size
          .height,
      padding: EdgeInsets.only(right: 0),
      color: col2,
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [col1, col2],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            )

        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 100,
            ),

            SizedBox(
              height: 100,
            ),
            Image.asset(
              imgUrl,
              height: 100,
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              ttl,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.only(left: 30.0, right: 30.0),
              child: Text(
                txt,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),

            //Show divider line close to the bottom
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 60.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Divider(
                    color: Colors.white,
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

class Indicator extends StatelessWidget {
  final carouselIndex, indicatorIndex;

  Indicator({this.carouselIndex, this.indicatorIndex});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 13,
      width: 13,
      margin: EdgeInsets.all(4),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: carouselIndex == indicatorIndex ? Colors.white : Colors.grey,
      ),
    );
  }
}

