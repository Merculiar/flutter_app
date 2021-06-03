import 'package:flutter/material.dart';
import 'screens/home.dart';
import 'screens/secondpage.dart';
void main() {
  runApp(MaterialApp(initialRoute: '/', routes: {
    '/': (BuildContext context) => Home(),
    '/second': (BuildContext context) => SecondPage()
  }));
}



