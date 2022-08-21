// import 'package:epharmacy/Signups/Ins/RegisterPage.dart';
// import 'package:epharmacy/Signups/Ins/RegisterPage1.dart';
import 'package:epharmacy/Signups/Ins/RegisterPage1.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
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
