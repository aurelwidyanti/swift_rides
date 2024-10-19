import 'package:flutter/material.dart';
import 'package:swift_rides/views/car_detail_screen.dart';
import 'views/home_screen.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => HomeScreen(),
  '/car-detail': (context) => const CarDetailScreen(
        name: '',
        type: '',
        price: 0,
        imageUrl: '',
      ),
};
