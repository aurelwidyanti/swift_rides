import 'package:flutter/material.dart';
import 'package:swift_rides/views/home/car_detail_screen.dart';
import 'package:swift_rides/views/home/widget/home_banner.dart';
import 'widget/car_card.dart';
import 'package:hugeicons/hugeicons.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get fuel => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              stops: [
                0.1,
                0.4,
              ],
              colors: [
                Color.fromRGBO(175, 203, 255, 1),
                Color.fromRGBO(255, 255, 255, 1)
              ],
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: Row(
                    children: [
                      HugeIcon(
                        icon: HugeIcons.strokeRoundedLocation01,
                        color: Colors.black,
                        size: 24.0,
                      ),
                      SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your Location',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Color.fromRGBO(0, 0, 0, 1),
                            ),
                          ),
                          Text(
                            'Semarang, Indonesia',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                const HomeBanner(),
                const SizedBox(height: 40),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recommendation',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 16),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          CarCard(
                            rating: 4.9,
                            name: 'BMW',
                            type: 'M4 Competition',
                            imageUrl: 'assets/img/1.png',
                            price: 800,
                            fuel: 'Petrol',
                            seat: 2,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CarDetailScreen(
                                    name: 'BMW',
                                    type: 'M4 Competition M xDrive',
                                    price: 800,
                                    imageUrl: 'assets/img/1.png',
                                  ),
                                ),
                              );
                            },
                          ),
                          CarCard(
                            rating: 4.8,
                            name: 'BMW',
                            type: 'M2 Coupé',
                            imageUrl: 'assets/img/3.png',
                            price: 700,
                            fuel: 'Petrol',
                            seat: 2,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CarDetailScreen(
                                    name: 'BMW',
                                    type: 'M2 Coupé',
                                    price: 700,
                                    imageUrl: 'assets/img/3.png',
                                  ),
                                ),
                              );
                            },
                          ),
                          CarCard(
                            rating: 4.7,
                            name: 'BMW',
                            type: 'M4 Convertible',
                            imageUrl: 'assets/img/2.png',
                            price: 800,
                            fuel: 'Petrol',
                            seat: 2,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const CarDetailScreen(
                                    name: 'BMW',
                                    type: 'M4 Convertible',
                                    price: 800,
                                    imageUrl: 'assets/img/2.png',
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
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
