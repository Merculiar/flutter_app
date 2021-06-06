import 'dart:math';
import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  double _width = 200;
  double _height = 200;
  late AnimationController _controller;
  late Animation _colorTween1;
  late Animation _colorTween2;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 10),
    );
    _colorTween1 =
        ColorTween(begin: Colors.white, end: Colors.black).animate(_controller);
    _colorTween2 =
        ColorTween(begin: Colors.black, end: Colors.white).animate(_controller)
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
        appBar: AnimatedAppBar(
            "Animation page", "assets/images/Mars.png", Colors.black, 390, 400),
        body: Container(
          color: _colorTween1.value,
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
                          color: _colorTween2.value,
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
                        primary: Colors.grey,
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
