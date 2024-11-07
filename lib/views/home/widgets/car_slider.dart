import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_rides/models/car_model.dart';
import 'package:swift_rides/providers/car_provider.dart';
import 'package:swift_rides/views/home/car_detail_screen.dart';
import 'package:swift_rides/views/home/widgets/car_card.dart';

class CarSlider extends StatelessWidget {
  const CarSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CarProvider>(builder: (context, carProvider, child) {
      final List<Car> cars = carProvider.cars;

      return cars.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : SizedBox(
              height: 300,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cars.length,
                itemBuilder: (context, index) {
                  final Car car = cars[index];
                  return CarCard(
                    car: car,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CarDetailScreen(car: car),
                        ),
                      );
                    },
                  );
                },
              ),
            );
    });
  }
}
