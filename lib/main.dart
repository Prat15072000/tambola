import 'package:flutter/material.dart';
import 'login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Login(),
      routes: {
//        'intro': (context) => Introduction(),
//        'setpro': (context) => Profile(),
        'login': (context) => Login(),
//        'dashboard': (context) => Dashboard(),
      },
    );
  }
}