import 'package:flutter/material.dart';

class DictionaryPage extends StatefulWidget {
  @override
  createState() => DictionaryPageState();
}

class DictionaryPageState extends State<DictionaryPage> {
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
