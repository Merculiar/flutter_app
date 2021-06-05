import 'package:flutter/material.dart';
import '../../widgets/app_bar.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AnimatedAppBar("Image page","assets/images/Moon.png", Colors.grey),
        body: Container(
            color: Colors.grey,
            alignment: Alignment.bottomCenter,
            child: SizedBox.expand(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  //photo
                  Image.asset('assets/images/Space.jpg'),
                  //text1
                  Text('Keep calm!',
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  //text2
                  Text('You can go back if you press the button below',
                      textDirection: TextDirection.ltr,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  //button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SizedBox(
                          width: 100,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[800],
                                onPrimary: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: Text('Go Back'))),
                      SizedBox(
                          width: 100,
                          height: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: Colors.grey[800],
                                onPrimary: Colors.white,
                              ),
                              onPressed: () {
                                Navigator.pushNamed(context, '/third');
                              },
                              child: Text('Next')))
                    ],
                  )
                ],
              ),
            )));
  }
}
