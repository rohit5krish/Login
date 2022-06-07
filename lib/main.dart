import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen_splash.dart';

// ignore: constant_identifier_names
const saved_val = 'user';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: const ScreenSplash(),
    );
  }
}
