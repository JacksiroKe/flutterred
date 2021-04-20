import 'dart:async';
import 'package:flutter/material.dart';

import 'home_page.dart';

class SplashPage extends StatefulWidget {
  @override
  createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), _handleTapEvent);

    return Scaffold(
      key: globalKey,
      body: _splashContainer(),
    );
  }

  Widget _splashContainer() {
    return GestureDetector(
      onTap: _handleTapEvent,
      child: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.blue[400],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                "BE",
                style: TextStyle(color: Colors.white, fontSize: 50),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                "Flutterred",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Text(
                "! ! !",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 50),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleTapEvent() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(0.0, 1.0);
          var end = Offset.zero;
          var curve = Curves.ease;

          var tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        },
      ),
    );
  }
}
