import 'package:flutter/material.dart';
import 'package:swift_rides/views/history/history_screen.dart';
import 'package:swift_rides/views/home/home_screen.dart';
import 'package:swift_rides/views/profile/profile_screen.dart';
import 'package:swift_rides/widgets/custom_bottom_bar.dart';
import 'utils/entrypoint.dart';

Future<void> main() async {
  runApp(MaterialApp(
    title: 'Swift Rides',
    theme: ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: const Entrypoint(),
  ));
}
