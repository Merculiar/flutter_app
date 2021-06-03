import 'package:flutter/material.dart';
import 'dart:math';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Random random = Random();
  Color color = Color.fromARGB(Random().nextInt(256), Random().nextInt(256),
      Random().nextInt(256), Random().nextInt(256));
  Color _textColor = Colors.black;

  void _colorChanger() {
    setState(() {
      int alpha = random.nextInt(256);
      int red = random.nextInt(256);
      int green = random.nextInt(256);
      int blue = random.nextInt(256);
      print("Red is $red");
      print("Green is $green");
      print("Blue is $blue");
      color = Color.fromARGB(alpha, red, green, blue);
      _textColor = (red * 299 + green * 587 + blue* 114) / 1000 > 125 ? Colors.black : Colors.white;
      print('You have changed color!');
      print('Color is now $color');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _colorChanger,
        child: SizedBox.expand(
          child: Container(
            color: color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    height: 50,
                    child: Text('Press on the screen to change color!',
                        textDirection: TextDirection.ltr,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: _textColor,
                        ))),
                Text(
                  'Hey there!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: _textColor,
                  ),
                ),
                SizedBox(
                  width: 140,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/second');
                      },
                      child: Text('Next page',
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: _textColor,
                          ))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
