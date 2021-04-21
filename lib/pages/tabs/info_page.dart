import 'package:flutter/material.dart';

import '../../utils/app_utils.dart';
import '../../utils/preferences.dart';
import '../start_page.dart';

class InfoPage extends StatefulWidget {
  @override
  createState() => InfoPageState();
}

class InfoPageState extends State<InfoPage> {
  final globalKey = GlobalKey<ScaffoldState>();

  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController phoneController = TextEditingController(text: "");
  TextEditingController emailController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: globalKey,
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.5, 0.9],
            colors: [
              Colors.white,
              Colors.blue,
              Colors.black,
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
          child: Form(
            child: Theme(
              data: ThemeData(primarySwatch: Colors.blue),
              child: Column(
                children: <Widget>[
                  nameInput(),
                  phoneInput(),
                  emailInput(),
                  submitButton(),
                ],
              ),
            ),
          ),
          margin: EdgeInsets.only(top: 20, left: 25, right: 25),
        ),
        Flexible(
          child: Container(),
        ),
      ],
    );
  }

  Widget nameInput() {
    return Container(
      child: TextFormField(
          controller: nameController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.face,
              color: Colors.blue,
            ),
            labelText: AppStrings.fullName,
            labelStyle: TextStyle(fontSize: 18.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          keyboardType: TextInputType.text),
      margin: EdgeInsets.only(bottom: 20.0),
    );
  }

  Widget phoneInput() {
    return Container(
      child: TextFormField(
          controller: phoneController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.phone,
              color: Colors.blue,
            ),
            labelText: AppStrings.mobilePhone,
            labelStyle: TextStyle(fontSize: 18.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          keyboardType: TextInputType.phone),
      margin: EdgeInsets.only(bottom: 20.0),
    );
  }

  Widget emailInput() {
    return Container(
      child: TextFormField(
          controller: emailController,
          decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.email,
              color: Colors.blue,
            ),
            labelText: AppStrings.emailAddress,
            labelStyle: TextStyle(fontSize: 18.0),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          keyboardType: TextInputType.emailAddress),
      margin: EdgeInsets.only(bottom: 20.0),
    );
  }

  Widget submitButton() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.blue[400],
        borderRadius: BorderRadius.circular(5),
        border: Border.all(color: Colors.white),
        boxShadow: [BoxShadow(blurRadius: 5)],
      ),
      child: MaterialButton(
        textColor: Colors.white,
        padding: EdgeInsets.all(15.0),
        onPressed: submitAction,
        child: Text(
          AppStrings.submit,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      margin: EdgeInsets.only(top: 10, bottom: 20),
    );
  }

  void submitAction() {
    if (nameController.text == "") {
      globalKey.currentState.showSnackBar(SnackBar(
        content: Text(AppStrings.enterFullName),
      ));
      return;
    }

    if (phoneController.text == "") {
      globalKey.currentState.showSnackBar(SnackBar(
        content: Text(AppStrings.enterMobilePhone),
      ));
      return;
    }

    if (emailController.text == "") {
      globalKey.currentState.showSnackBar(SnackBar(
        content: Text(AppStrings.enterEmailAddress),
      ));
      return;
    }

    if (emailController.text == "") {
      globalKey.currentState.showSnackBar(SnackBar(
        content: Text(AppStrings.enterEmailAddress),
      ));
      return;
    }

    FocusScope.of(context).requestFocus(FocusNode());
    submitNow();
  }

  void submitNow() async {
    Preferences.setSharedPreferenceStr(
        SharedPreferenceKeys.appUserName, nameController.text);
    Preferences.setSharedPreferenceStr(
        SharedPreferenceKeys.appUserMobile, phoneController.text);
    Preferences.setSharedPreferenceStr(
        SharedPreferenceKeys.appUserEmail, emailController.text);

    globalKey.currentState.showSnackBar(SnackBar(
      content: Text(AppStrings.userRegistrationSuccess),
    ));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => StartPage()),
    );
  }
}
