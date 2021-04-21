import 'dart:async';
import 'package:flutter/material.dart';

import 'home_page.dart';
import '../utils/preferences.dart';

class SplashPage extends StatefulWidget {
  @override
  createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 5), handleTapEvent);

    return Scaffold(
      key: globalKey,
      body: splashContainer(),
    );
  }

  Widget splashContainer() {
    return GestureDetector(
      onTap: handleTapEvent,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.white, Colors.blue, Colors.black]),
        ),
        child: Center(
          child: Container(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: [
                  Colors.white,
                  Colors.blue,
                  Colors.black,
                  Colors.blue,
                  Colors.white,
                  Colors.blue,
                  Colors.black,
                  Colors.blue,
                  Colors.white,
                  Colors.blue,
                  Colors.black,
                  Colors.blue,
                  Colors.white,
                  Colors.blue,
                  Colors.black,
                  Colors.blue
                ],
                stops: [
                  0.1,
                  0.2,
                  0.3,
                  0.4,
                  0.5,
                  0.6,
                  0.7,
                  0.8,
                  0.9,
                  1.0,
                  1.1,
                  1.2,
                  1.3,
                  1.4,
                  1.5,
                  1.6
                ],
              ),
              borderRadius:
                  BorderRadius.circular(MediaQuery.of(context).size.width / 2),
            ),
            child: Center(
              child: Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(70),
                  boxShadow: [BoxShadow(blurRadius: 5)],
                ),
                child: FlutterLogo(
                  size: 100,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void handleTapEvent() async {
    Preferences.clear();
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomePage(0),
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
