import 'package:flutter/material.dart';
import 'package:flutter_app/screens/homepage/homepage.dart';
import 'package:flutter_app/screens/thirdpage/thirdpage.dart';
import 'screens/homepage/homepage.dart';
import 'screens/secondpage/secondpage.dart';
void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (BuildContext context) => HomePage(),
    '/second': (BuildContext context) => SecondPage(),
    '/third': (BuildContext context) => ThirdPage(),
  }));
}



