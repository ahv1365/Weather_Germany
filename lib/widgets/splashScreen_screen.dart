import 'dart:async';

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

    startTime() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationPage);
  }

void navigationPage() {
  Navigator.of(context).pushReplacementNamed('/HomeScreen');
}
  
@override
void initState() {
  super.initState();
  startTime();
}
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
    body: new Center(
      child: new Image.asset('assets/splash.png', fit: BoxFit.contain,),
    ),
  );
  }
}