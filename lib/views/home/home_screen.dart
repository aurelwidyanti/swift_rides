import 'package:flutter/material.dart';
import 'package:swift_rides/utils/constants.dart';
import 'package:swift_rides/views/home/car_detail_screen.dart';
import 'package:swift_rides/views/home/widget/home_banner_slide.dart';
import 'package:swift_rides/views/profile/profile_screen.dart';
import 'widget/car_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  get fuel => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: const EdgeInsets.only(top: 48),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
                child: Row(
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome back,',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Text(
                          'Aurel',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: const Color.fromRGBO(23, 93, 227, 1),
                            width: 6),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ProfileScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(16),
                child: HomeBannerSlide(images: demoBanner),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(16, 24, 0, 24),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Recommendation',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
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
                                      builder: (context) =>
                                          const CarDetailScreen(
                                        name: 'BMW',
                                        type: 'M4 Competition',
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
                                      builder: (context) =>
                                          const CarDetailScreen(
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
                                      builder: (context) =>
                                          const CarDetailScreen(
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
                    const SizedBox(height: 24),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'New Cars',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
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
                                      builder: (context) =>
                                          const CarDetailScreen(
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
                                      builder: (context) =>
                                          const CarDetailScreen(
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
                                      builder: (context) =>
                                          const CarDetailScreen(
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
            ],
          ),
        ),
      ),
    );
  }
}
