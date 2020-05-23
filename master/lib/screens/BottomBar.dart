import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import 'package:travelsafe/screens/LandingScreen.dart';
import 'package:travelsafe/screens/alert.dart';
import 'package:travelsafe/screens/group.dart';
import 'package:travelsafe/screens/track.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  int pageIndex = 0;

  final Track _track = Track();
  final LandingScreen _landingScreen = LandingScreen();
  final Group _group = Group();
  final Share _share = Share();
  final Alert _alert = Alert();

  Widget _showPage = Track();

  Widget _pageChooser(int page) {
    switch (page) {
      case 0:
        return _track;
        break;
      case 1:
        return _landingScreen;
        break;
      case 2:
        return _group;
        break;
    }
  }

  GlobalKey _bottomNavigationKey = GlobalKey();

  List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>()
  ];

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final isFirstRouteInCurrentTab =
            !await _navigatorKeys[pageIndex].currentState.maybePop();

        // let system handle back button if we're on the first route
        return isFirstRouteInCurrentTab;
      },
      child: Scaffold(
          bottomNavigationBar: CurvedNavigationBar(
            index: pageIndex,
            key: _bottomNavigationKey,
            backgroundColor: Colors.white,
            color: Colors.grey.shade800,
            items: <Widget>[
              Icon(
                Icons.location_on,
                size: 25.0,
                color: Colors.white,
              ),
              Icon(
                Icons.home,
                size: 25.0,
                color: Colors.white,
              ),
              Icon(
                Icons.notifications_active,
                size: 25.0,
                color: Colors.white,
              ),
            ],
            onTap: (int tappedIndex) {
              setState(() {
                pageIndex = tappedIndex;
                // _showPage = _pageChooser(tappedIndex);
              });
            },
          ),
          body: Stack(
            children: <Widget>[
              _buildOffstageNavigator(0),
              _buildOffstageNavigator(1),
              _buildOffstageNavigator(2),
            ],
          )
          //_showPage,
          ),
    );
  }

  Map<String, WidgetBuilder> _routeBuilders(BuildContext context, int index) {
    return {
      '/': (context) {
        return [
          Track(),
          LandingScreen(),
          Group(),
        ].elementAt(index);
      },
    };
  }

  Widget _buildOffstageNavigator(int index) {
    var routeBuilders = _routeBuilders(context, index);

    return Offstage(
      offstage: pageIndex != index,
      child: Navigator(
        key: _navigatorKeys[index],
        onGenerateRoute: (routeSettings) {
          return MaterialPageRoute(
            builder: (context) => routeBuilders[routeSettings.name](context),
          );
        },
      ),
    );
  }
}
