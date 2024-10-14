import 'package:flutter/material.dart';
import '../widgets/car_card.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get fuel => null;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.fromLTRB(24, 64, 24, 24),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    HugeIcon(
                      icon: HugeIcons.strokeRoundedLocation04,
                      color: Color.fromRGBO(167, 167, 167, 1),
                      size: 28,
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Location',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            color: Color.fromRGBO(167, 167, 167, 1),
                          ),
                        ),
                        Text(
                          'Semarang, Indonesia',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Recommendation',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    CarCard(
                      rating: 4.9,
                      name: 'BMW',
                      type: 'M4 Competition M xDrive',
                      imageUrl: 'assets/img/1.png',
                      price: 800,
                      fuel: 'Petrol',
                      seat: 2,
                    ),
                    CarCard(
                      rating: 4.8,
                      name: 'BMW',
                      type: 'M2 Coupé',
                      imageUrl: 'assets/img/3.png',
                      price: 700,
                      fuel: 'Petrol',
                      seat: 2,
                    ),
                    CarCard(
                      rating: 4.7,
                      name: 'BMW',
                      type: 'M4 Convertible',
                      imageUrl: 'assets/img/2.png',
                      price: 800,
                      fuel: 'Petrol',
                      seat: 2,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
