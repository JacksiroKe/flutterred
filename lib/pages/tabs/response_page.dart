import 'package:flutter/material.dart';

class ResponsePage extends StatefulWidget {
  @override
  createState() => ResponsePageState();
}

class ResponsePageState extends State<ResponsePage> {
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
