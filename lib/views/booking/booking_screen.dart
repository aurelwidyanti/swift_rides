import 'package:flutter/material.dart';
import 'package:swift_rides/widgets/custom_app_bar.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(title: 'Order Summary'),
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 64, 24, 24),
          child: Column(
            children: [
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
