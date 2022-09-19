// ignore_for_file: import_of_legacy_library_into_null_safe

import 'package:epharmacy/features/Signups/Ins/LandingPage.dart';
import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Luveen',
      theme: ThemeData(
        
        primarySwatch: Colors.green,
      ),
      home: SplashScreen(
        seconds:2,
        navigateAfterSeconds:LandingPage(),
        
        image: new Image.asset('assets/SplashScreenLogo.png'),
        photoSize: 230.0, 
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: new TextStyle(),
        loaderColor: Colors.green
    ),);
  }
}
