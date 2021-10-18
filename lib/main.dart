import 'package:flutter/material.dart';
import 'package:imuwalletweb/screen/onboarding.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:  Onboarding(),
    );
  }
}
