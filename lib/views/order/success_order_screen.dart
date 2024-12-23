import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:swift_rides/models/booking_model.dart';
import 'package:swift_rides/utils/entrypoint.dart';
import 'package:swift_rides/views/order/widgets/summary_item.dart';
import 'package:swift_rides/widgets/custom_app_bar.dart';

class SuccessOrderScreen extends StatelessWidget {
  final Booking booking;
  const SuccessOrderScreen({Key? key, required this.booking}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: 'Booking Confirmed',
        showBackButton: false,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Entrypoint(),
                ),
              );
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 16),
              child: HugeIcon(
                icon: HugeIcons.strokeRoundedCancel01,
                color: Colors.black,
                size: 24.0,
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green[100],
                shape: BoxShape.circle,
              ),
              child: const HugeIcon(
                icon: HugeIcons.strokeRoundedTick01,
                color: Colors.black,
                size: 24.0,
              ),
            ),
            const SizedBox(height: 40),
            const Text(
              'Thanks, your booking has been confirmed.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'You can check the booking details below. Please wait for the admin to contact you for more information.',
              style: TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: Colors.black12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Booking Details',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 16),
                  SummaryItem(
                    title: 'Drop Point',
                    value: booking.address!.street,
                  ),
                  SummaryItem(
                    title: 'Car ',
                    value: booking.car!.name,
                  ),
                  SummaryItem(
                    title: 'Price (/day)',
                    value: 'IDR ${booking.car!.price! ~/ 1000}K',
                  ),
                  SummaryItem(
                    title: 'Start Date',
                    value:
                        '${booking.startDate!.year}-${booking.startDate!.month}-${booking.startDate!.day}',
                  ),
                  SummaryItem(
                    title: 'End Date',
                    value:
                        '${booking.endDate!.year}-${booking.endDate!.month}-${booking.endDate!.day}',
                  ),
                  SummaryItem(
                    title: 'Duration',
                    value:
                        '${booking.endDate!.difference(booking.startDate!).inDays} days',
                  ),
                  const Divider(height: 16, thickness: 0.5),
                  SummaryItem(
                    title: 'Total',
                    value: 'IDR ${booking.totalPrice}',
                    titleStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                    valueStyle: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
