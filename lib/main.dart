import 'package:flutter/material.dart';
import 'package:swift_rides/views/splash_screen.dart';

Future<void> main() async {
  runApp(MaterialApp(
    title: 'Swift Rides',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const SplashScreen(),
  ));
}
