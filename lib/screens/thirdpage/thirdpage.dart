import 'dart:math';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  double _width = 200;
  double _height = 200;
  late AnimationController _controller;
  late Animation _colorTween;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    );
    _colorTween =
        ColorTween(begin: Colors.red, end: Colors.blue).animate(_controller)
          ..addListener(() {
            setState(() {});
          });
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget moving(child) {
    return Transform.rotate(
      angle: _controller.value * 2 * pi,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Animation page'),
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          color: Colors.blue[100],
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              SizedBox(),
              AnimatedBuilder(
                  animation: _controller.view,
                  builder: (context, child) {
                    return moving(child);
                  },
                  child: Transform.scale(
                      scale: _controller.value * 1.2,
                      child: Container(
                          width: _width,
                          height: _height,
                          color: _colorTween.value,
                          child: Center(
                              child: Text('Hey There!',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5))))),
              //button
              SizedBox(
                  width: 100,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Go Back')))
            ],
          ),
        ));
  }
}
