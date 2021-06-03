import 'package:flutter/material.dart';
import 'screens/homepage/homepage.dart';
import 'screens/secondpage/secondpage.dart';
import 'screens/thirdpage/thirdpage.dart';

void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (BuildContext context) => HomePage(),
    '/second': (BuildContext context) => SecondPage(),
    '/third': (BuildContext context) => ThirdPage(),
  }));
}



