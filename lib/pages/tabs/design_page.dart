import 'package:flutter/material.dart';

import '../../utils/app_utils.dart';
import '../../utils/preferences.dart';

class DesignPage extends StatefulWidget {
  @override
  createState() => DesignPageState();
}

class DesignPageState extends State<DesignPage> {
  final globalKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");

  String userName;
  String userEmail;
  String userPhone;

  @override
  Future<void> didChangeDependencies() async {
    super.didChangeDependencies();
    if (userName == null) {
      await initUserProfile();
    }
  }

  Future<void> initUserProfile() async {
    String name = await Preferences.getSharedPreferenceStr(
        SharedPreferenceKeys.appUserName);
    String phone = await Preferences.getSharedPreferenceStr(
        SharedPreferenceKeys.appUserMobile);
    String email = await Preferences.getSharedPreferenceStr(
        SharedPreferenceKeys.appUserEmail);

    setState(() {
      userName = name;
      userPhone = phone;
      userEmail = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    didChangeDependencies();
    return Scaffold(
      key: globalKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              Colors.black,
              Colors.blue,
              Colors.white,
            ],
            center: Alignment(0.6, -0.3),
            focal: Alignment(0.3, -0.1),
            focalRadius: 1.0,
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
          child: Form(
            child: Theme(
              data: ThemeData(primarySwatch: Colors.blue),
              child: Column(
                children: <Widget>[
                  userProfile(),
                ],
              ),
            ),
          ),
          margin: EdgeInsets.only(top: 20, left: 25, right: 25),
        ),
        SizedBox(height: 20),
        userContacts(),
        Flexible(
          child: Container(),
        ),
      ],
    );
  }

  Widget userProfile() {
    return Container(
      child: Row(
        children: <Widget>[
          userAvatar(),
          SizedBox(width: 10),
          Flexible(
            child: userDetails(),
          ),
        ],
      ),
      margin: EdgeInsets.only(bottom: 20.0),
    );
  }

  Widget userAvatar() {
    return Container(
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [BoxShadow(blurRadius: 5)],
      ),
      child: Icon(
        Icons.face,
        color: Colors.blue,
        size: 70,
      ),
    );
  }

  Widget userDetails() {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            ((userName == null) ? "" : userName),
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
          ),
          Divider(),
          Text(
            "Last seen: Recently",
            style: TextStyle(fontSize: 15),
          ),
        ],
      ),
    );
  }

  Widget userContacts() {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [BoxShadow(blurRadius: 5)],
      ),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text(
              "CONTACTS",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Divider(),
          Row(
            children: <Widget>[
              Icon(Icons.phone),
              SizedBox(width: 10),
              Text(
                ((userPhone == null) ? "" : userPhone),
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Icon(Icons.email_outlined),
              SizedBox(width: 10),
              Text(
                ((userEmail == null) ? "" : userEmail),
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
