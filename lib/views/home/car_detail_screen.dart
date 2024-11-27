import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:swift_rides/models/car_model.dart';
import 'package:swift_rides/providers/booking_provider.dart';
import 'package:swift_rides/views/order/widgets/calendar_bottom_sheet.dart';
import 'package:swift_rides/widgets/custom_app_bar.dart';

class CarDetailScreen extends StatelessWidget {
  final Car car;

  const CarDetailScreen({super.key, required this.car});

  Widget _specItem(HugeIcon icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[900],
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showBookingBottomSheet(
      BuildContext context, int carId, String car, double price) async {
    Provider.of<BookingProvider>(context, listen: false).carId = carId;
    Provider.of<BookingProvider>(context, listen: false).car = car;
    Provider.of<BookingProvider>(context, listen: false).price = price;
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (context) => const CalendarBottomSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(
        title: 'Car Detail',
        textColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(
                'https://7469-182-253-134-145.ngrok-free.app/storage/cars/${car.image!}',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.error,
                  color: Colors.red,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                            fontSize: 16,
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
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            letterSpacing: 0.14,
                          ),
                        ),
                        const TextSpan(
                          text: '/day',
                          style: TextStyle(
                            color: Color.fromRGBO(178, 176, 176, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: _specItem(
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedDashboardSpeed02,
                        color: Colors.black,
                        size: 20,
                      ),
                      'Transmission',
                      car.transmission!,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: _specItem(
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedSeatSelector,
                        color: Colors.black,
                        size: 20,
                      ),
                      'Seats',
                      car.seat!.toString(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Flexible(
                    child: _specItem(
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedCar01,
                        color: Colors.black,
                        size: 20,
                      ),
                      'Type',
                      car.type!,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: _specItem(
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedFuelStation,
                        color: Colors.black,
                        size: 20,
                      ),
                      'Fuel',
                      car.fuel!,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              const SizedBox(height: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 15,
                      letterSpacing: 0.14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    car.description!,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(167, 167, 167, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'IDR ${car.price! ~/ 1000}K',
                      style: const TextStyle(
                        color: Color.fromRGBO(23, 92, 227, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.14,
                      ),
                    ),
                    const TextSpan(
                      text: '/day',
                      style: TextStyle(
                        color: Color.fromRGBO(178, 176, 176, 1),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 0.14,
                      ),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _showBookingBottomSheet(
                      context, car.id!, car.name!, car.price!.toDouble());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(23, 92, 227, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Book Now',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
