import 'dart:async';
import 'package:flutter/material.dart';

import 'home_page.dart';

class StartPage extends StatefulWidget {
  @override
  createState() => StartPageState();
}

class StartPageState extends State<StartPage> {
  final globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 1), handleTapEvent);

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
          gradient: SweepGradient(
            colors: [Colors.white, Colors.blue, Colors.white],
          ),
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
    );
  }

  void handleTapEvent() async {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) => HomePage(1),
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
