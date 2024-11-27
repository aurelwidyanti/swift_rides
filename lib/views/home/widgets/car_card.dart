import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_rides/models/car_model.dart';

class CarCard extends StatelessWidget {
  final Car car;
  final Function onTap;

  const CarCard({super.key, required this.car, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: SizedBox(
        width: 300,
        height: 300,
        child: Card(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
            side: const BorderSide(
              color: Color.fromARGB(255, 220, 220, 220),
              width: 1,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 16, 20, 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(226, 236, 243, 1),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        car.status == 'available'
                            ? 'Available'
                            : car.status == 'rented'
                                ? 'Rented'
                                : 'Maintenance',
                        style: const TextStyle(
                          color: Color.fromRGBO(23, 92, 227, 1),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1,
                        ),
                      ),
                    ),
                  ],
                ),
                Image.network(
                  'https://dd4c-114-79-23-236.ngrok-free.app/storage/cars/${car.image!}',
                  width: 300,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Icon(
                    Icons.error,
                    color: Colors.red,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          car.brand!,
                          style: const TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.14,
                          ),
                        ),
                        Text(car.name!,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.14,
                            )),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'IDR ${car.price! ~/ 1000}K',
                            style: const TextStyle(
                              color: Color.fromRGBO(23, 92, 227, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.14,
                            ),
                          ),
                          const TextSpan(
                            text: '/day',
                            style: TextStyle(
                              color: Color.fromRGBO(178, 176, 176, 1),
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const Divider(
                  color: Color.fromRGBO(216, 234, 233, 1),
                  thickness: 1,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedFuelStation,
                          color: Color.fromRGBO(23, 92, 227, 1),
                          size: 24,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          car.fuel!,
                          style: const TextStyle(
                            color: Color.fromRGBO(178, 176, 176, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.14,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Row(
                      children: [
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedUser,
                          color: Color.fromRGBO(23, 92, 227, 1),
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          car.seat!.toStringAsFixed(0),
                          style: const TextStyle(
                            color: Color.fromRGBO(178, 176, 176, 1),
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.14,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
