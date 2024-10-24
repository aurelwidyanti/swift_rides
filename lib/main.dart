import 'package:flutter/material.dart';

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
