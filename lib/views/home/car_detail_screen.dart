import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_rides/views/booking/widgets/calendar_bottom_sheet.dart';
import 'package:swift_rides/widgets/custom_app_bar.dart';

class CarDetailScreen extends StatelessWidget {
  final String name;
  final String type;
  final double price;
  final String imageUrl;

  const CarDetailScreen(
      {super.key,
      required this.name,
      required this.type,
      required this.price,
      required this.imageUrl});

  Widget _specItem(HugeIcon icon, String label, String value) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(4),
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
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showBookingBottomSheet(BuildContext context) async {
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
      appBar: const CustomAppBar(title: 'Car Detail'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                imageUrl,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.14,
                        ),
                      ),
                      Text(type,
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
                          text: 'IDR ${price.toStringAsFixed(0)}K',
                          style: const TextStyle(
                            color: Color.fromRGBO(23, 93, 227, 1),
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
                        'Automatic'),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: _specItem(
                        const HugeIcon(
                          icon: HugeIcons.strokeRoundedSeatSelector,
                          color: Colors.black,
                          size: 20,
                        ),
                        'Passengers',
                        '4 adults'),
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
                        'Hatchback'),
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
                        'Petrol'),
                  ),
                ],
              ),
              const SizedBox(height: 18),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
              const SizedBox(height: 12),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description',
                    style: TextStyle(
                      fontSize: 14,
                      letterSpacing: 0.14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam faucibus nibh sed diam pharetra condimentum. Vivamus varius, leo at tincidunt placerat, sapien justo congue turpis, sed.',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Color.fromRGBO(167, 167, 167, 1),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Divider(
                color: Colors.grey[300],
                thickness: 1,
              ),
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
                      text: 'IDR ${price.toStringAsFixed(0)}K',
                      style: const TextStyle(
                        color: Color.fromRGBO(23, 93, 227, 1),
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
                  _showBookingBottomSheet(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(23, 93, 227, 1),
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
