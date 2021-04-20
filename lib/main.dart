import 'package:flutter/material.dart';

import 'utils/app_utils.dart';
import 'pages/splash_page.dart';

void main() => runApp(MyApp());

///The genesis of this great app
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}
