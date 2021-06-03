import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Home> {
  final Random random = Random();
  Color color = Color.fromARGB(Random().nextInt(256), Random().nextInt(256),
      Random().nextInt(256), Random().nextInt(256));

  Color colorChanger() {
    int alpha = random.nextInt(256);
    int red = random.nextInt(256);
    int green = random.nextInt(256);
    int blue = random.nextInt(256);
    print("Red is $red");
    print("Green is $green");
    print("Blue is $blue");
    color = Color.fromARGB(alpha, red, green, blue);
    return color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          setState(() {
            colorChanger();
          });
          print('You have changed color!');
          print('Color is now $color');
        },
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
                        ))),
                Text(
                  'Hey there!',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/second');
                      },
                      child: Text('Next page',
                          textDirection: TextDirection.ltr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
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
