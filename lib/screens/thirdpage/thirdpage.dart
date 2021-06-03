import 'dart:math';
import 'package:flutter/material.dart';

class ThirdPage extends StatefulWidget {
  @override
  _ThirdPageState createState() => _ThirdPageState();
}

class _ThirdPageState extends State<ThirdPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 8),
    );
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
                    return Transform.rotate(
                      angle: _controller.value * 2 * pi,
                      child: child,
                    );
                  },
                  child: Container(
                      width: 200,
                      height: 200,
                      color: Colors.lightBlue[200],
                      child: Center(
                          child: Text('Hey There!',
                              style: Theme.of(context).textTheme.headline5)))),
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
