import 'package:flutter/material.dart';

class DesignPage extends StatefulWidget {
  @override
  createState() => DesignPageState();
}

class DesignPageState extends State<DesignPage> {
  final globalKey = GlobalKey<ScaffoldState>();
  String pageTitle = "Flutterred";
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: SafeArea(
        child: mainBody(),
      ),
    );
  }

  Widget mainBody(){
    return Container(              
      
    );
  }

}
