import 'package:ezopurse/views/authentication/onboarding.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class Splash extends StatefulWidget {
  // const Splash({ Key? key }) : super(key: key);

  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  final splashDelay = 5;

   @override
  void initState() {
    super.initState();

    _loadWidget();
  }

  _loadWidget() async {
    var _duration = Duration(seconds: splashDelay);
    return Timer(_duration, navigationPage);
  }

  void navigationPage() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => Onboarding()));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Image(image: AssetImage('images/logo1.png')),
    );
  }
}