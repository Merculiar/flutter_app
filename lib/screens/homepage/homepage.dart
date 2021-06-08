import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Random random = Random();
  Color _color = Color.fromARGB(Random().nextInt(256), Random().nextInt(256),
      Random().nextInt(256), Random().nextInt(256));
  Color _textColor = Colors.black;
  Color _textColor2 = Colors.white;
  bool _isRunning = false;
  int _speed = 2;
  Timer _timer = Timer.periodic(Duration(seconds: 0), (Timer t) {});

  void colorChanger() {
    setState(() {
      int alpha = random.nextInt(256);
      int red = random.nextInt(256);
      int green = random.nextInt(256);
      int blue = random.nextInt(256);
      print("Red is $red");
      print("Green is $green");
      print("Blue is $blue");
      _color = Color.fromARGB(alpha, red, green, blue);
      _textColor = (red * 299 + green * 587 + blue * 114) / 1000 > 125
          ? Colors.black
          : Colors.white;
      _textColor2 = (red * 299 + green * 587 + blue * 114) / 1000 > 125
          ? Colors.white
          : Colors.black;
      print('You have changed color!');
      print('Color is now $_color');
    });
  }

  void autocolorChanger() {
    var wait = Duration(seconds: _speed);
    if (_isRunning) return;
    _isRunning = true;
    _timer = Timer.periodic(wait, (Timer t) {
      colorChanger();
    });
  }

  void stop() {
    _isRunning = false;
    _timer.cancel();
    print("Stopped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: colorChanger,
        child: SizedBox.expand(
          child: Container(
            color: _color,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      icon: Icon(Icons.play_circle_rounded),
                      tooltip: 'Start auto generation',
                      iconSize: 60,
                      onPressed: () {
                        autocolorChanger();
                      },
                    ),
                    Column(children: [
                      Text('Set the speed',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: _textColor,
                          )),
                      Text('(you need to pause and run again',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: _textColor,
                          )),
                      Text('to see the result)',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: _textColor,
                          )),
                      Slider(
                        activeColor: _textColor,
                        inactiveColor: _textColor2,
                        value: _speed.toDouble(),
                        onChanged: (newspeed) {
                          setState(() {
                            _speed = newspeed.toInt();
                          });
                        },
                        label: "$_speed sec",
                        min: 1,
                        max: 10,
                        divisions: 9,
                      )
                    ]),
                    IconButton(
                      icon: Icon(Icons.pause_circle_rounded),
                      tooltip: 'Start auto generation',
                      iconSize: 60,
                      onPressed: () {
                        stop();
                      },
                    ),
                  ],
                ),
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
                        stop();
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
