import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_rides/providers/address_provider.dart';
import 'package:swift_rides/providers/booking_provider.dart';
import 'package:swift_rides/providers/car_provider.dart';
import 'package:swift_rides/providers/user_provider.dart';
import 'package:swift_rides/views/splash_screen.dart';

Future<void> main() async {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => CarProvider()),
        ChangeNotifierProvider(create: (_) => BookingProvider()),
        ChangeNotifierProvider(create: (_) => AddressProvider()),
      ],
      child: MaterialApp(
        title: 'Swift Rides',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
