import 'package:ezopurse/constant/color.dart';
import 'package:ezopurse/views/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EzoPurse',
      debugShowCheckedModeBanner:false,
      // theme: ThemeData(primarySwatch: Colors.white, buttonColor: Colors.amber),
      home: Splash(),
    );
  }
}