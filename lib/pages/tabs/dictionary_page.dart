import 'package:flutter/material.dart';

class DictionaryPage extends StatefulWidget {
  @override
  createState() => DictionaryPageState();
}

class DictionaryPageState extends State<DictionaryPage> {
  final globalKey = GlobalKey<ScaffoldState>();

  var dictionary = {
    '34': 'thirty-four',
    '90': 'ninety',
    '91': 'ninety-one',
    '21': 'twenty-one',
    '61': 'sixty-one',
    '9': 'nine',
    '2': 'two',
    '6': 'six',
    '3': 'three',
    '8': 'eight',
    '80': 'eighty',
    '81': 'eighty-one',
    'Ninety-Nine': '99',
    'nine-hundred': '900'
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              Colors.white,
              Colors.blue,
            ],
          ),
        ),
        child: mainBody(),
      ),
    );
  }

  Widget mainBody() {
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [BoxShadow(blurRadius: 5)],
          ),
          child: dictionaryValues(),
          margin: EdgeInsets.only(top: 20, left: 25, right: 25),
        ),
        Flexible(
          child: Container(),
        ),
      ],
    );
  }

  Widget dictionaryValues() {
    List<String> map = dictionary.keys.toList()..sort();
    List<int> map2 = [];

    for (int i = 0; i < map.length; i++) map2.add(int.parse(map[i]));
    map2.sort();
    String finalStr = map2[0].toString() + " : " + dictionary[map2[0].toString()];

    for (int i = 1; i < map.length; i++) {
      finalStr = finalStr + "\n" + map2[i].toString() + " : " + dictionary[map2[i].toString()];
    }

    return ListTile(
      title: Text(
        finalStr,
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
