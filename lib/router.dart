// import 'package:epharmacy/Signups/Ins/RegisterPage.dart';
// import 'package:epharmacy/Signups/Ins/RegisterPage1.dart';
import 'package:epharmacy/features/Signups/Ins/LandingPage.dart';
import 'package:epharmacy/features/Signups/Ins/RegisterPage1.dart';
import 'package:epharmacy/features/home/screen/home_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case HomeScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const HomeScreen(),
      );
    case RegisterPage1.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const RegisterPage1(),
      );
    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Page doesnot exit'),
          ),
        ),
      );
  }
}
