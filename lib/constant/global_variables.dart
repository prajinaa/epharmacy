import 'package:flutter/material.dart';

String uri = 'http://192.168.100.65:3000'; 

// String uri ='http://192.168.1.194:3000';
// String uri ='http://192.168.38.62:3000';
// 192.168.1.194
// : 192.168.1.194
// 192.168.1.194----wifi 
class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;
}