import 'package:flutter/material.dart';
import 'views/home_screen.dart';
import 'views/car_detail_screen.dart';
import 'views/booking_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => HomeScreen(),
};
