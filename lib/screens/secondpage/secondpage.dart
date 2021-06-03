import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Image page'),
          backgroundColor: Colors.red,
        ),
        body: Container(
          color: Colors.pink[100],
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              //photo
              Image.asset('assets/images/KeepCalm.jpg'),
              //text1
              Text('Keep calm!',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  )),
              //text2
              Text('You can go back if you press the button below',
                  textDirection: TextDirection.ltr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                            primary: Colors.red,
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
                            primary: Colors.red,
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
        ));
  }
}
