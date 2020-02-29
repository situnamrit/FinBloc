import 'package:flutter/material.dart';
import 'package:block_corrupt/screens/loginpagematic.dart';

import 'package:avatar_glow/avatar_glow.dart';

import 'package:flutter/services.dart';
import 'package:block_corrupt/utils/delayedanimation.dart';

void main() {
  SystemChrome.setEnabledSystemUIOverlays([]);
  runApp(LoginPage());
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage>
    with SingleTickerProviderStateMixin {
  final int delayedAmount = 500;
  double _scale;
  AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 200,
      ),
      lowerBound: 0.0,
      upperBound: 0.1,
    )..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    final color = Colors.blue;
    _scale = 1 - _controller.value;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              children: <Widget>[
                SizedBox(height:50),
                Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    AvatarGlow(
                      endRadius: 120,
                      duration: Duration(seconds: 2),
                      glowColor: Colors.blueAccent,
                      repeat: true,
                      repeatPauseDuration: Duration(seconds: 1),
                      startDelay: Duration(seconds: 1),
                      child: Container(),
                    ),
                    Positioned(
                        top: 65,
                        child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.transparent,
                            child: Image.asset('assets/xyz3.png')))
                  ],
                ),
                /*DelayedAnimation(
                  child: Text(
                    "Hi There",
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: color),
                  ),
                  delay: delayedAmount + 1000,
                ),
                DelayedAnimation(
                  child: Text(
                    "Welcome to",
                    style: TextStyle(
                        //fontWeight: FontWeight.bold,
                        fontSize: 30.0,
                        color: color),
                  ),
                  delay: delayedAmount + 2000,
                ),
                SizedBox(
                  height: 30.0,
                ),*/
                DelayedAnimation(
                  child: Text(
                    "FinBloc",
                    style: TextStyle(
                        fontSize: 40.0, color: color, letterSpacing: 2.0),
                  ),
                  delay: delayedAmount + 2000,
                ),
                DelayedAnimation(
                  child: Text(
                    "The Cutting Edge Solution\n     To Managing Funds",
                    style: TextStyle(
                        fontSize: 20.0, color: color, letterSpacing: 2.0),
                  ),
                  delay: delayedAmount + 3000,
                ),
                SizedBox(
                  height: 100.0,
                ),
                SizedBox(
                  height: 50.0,
                ),
                DelayedAnimation(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 10.0, bottom: 15.0, left: 5.0),
                    child: Text(
                      "Select your User",
                      style: TextStyle(
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                          color: color),
                    ),
                  ),
                  delay: delayedAmount + 4000,
                ),
                DelayedAnimation(
                  child: GestureDetector(
                    child: Transform.scale(
                      scale: _scale,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _animatedButtonUI,
                      ),
                    ),
                  ),
                  delay: delayedAmount + 5000,
                ),
                DelayedAnimation(
                  child: GestureDetector(
                    child: Transform.scale(
                      scale: _scale,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _animatedButton1UI,
                      ),
                    ),
                  ),
                  delay: delayedAmount + 5000,
                ),
                DelayedAnimation(
                  child: GestureDetector(
                    child: Transform.scale(
                      scale: _scale,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _animatedButton2UI,
                      ),
                    ),
                  ),
                  delay: delayedAmount + 5000,
                ),
              ],
            ),
          )
          //  Column(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: <Widget>[
          //     Text('Tap on the Below Button',style: TextStyle(color: Colors.grey[400],fontSize: 20.0),),
          //     SizedBox(
          //       height: 20.0,
          //     ),
          //      Center(

          //   ),
          //   ],

          // ),
          ),
    );
  }

  Widget get _animatedButtonUI => GestureDetector(
        onTap: () {
    Navigator.push(
      context,
    MaterialPageRoute(builder: (context) => Login_email()),
  );
  },
        child: Container(
          height: 60,
          width: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              'Government',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

  Widget get _animatedButton1UI => GestureDetector(
            onTap: () {
    Navigator.push(
      context,
    MaterialPageRoute(builder: (context) => Login_email()),
  );
  },
        child: Container(
          height: 60,
          width: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              'Contractor',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

  Widget get _animatedButton2UI => GestureDetector(
            onTap: () {
    Navigator.push(
      context,
    MaterialPageRoute(builder: (context) => Login_email()),
  );
  },
      child: Container(
          height: 60,
          width: 270,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100.0),
            color: Colors.blue,
          ),
          child: Center(
            child: Text(
              'Material Dealer',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
        ),
  );
}
