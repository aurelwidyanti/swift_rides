import 'package:flutter/material.dart';
import 'package:swift_rides/views/order/widgets/summary_item.dart';
import 'package:swift_rides/widgets/custom_app_bar.dart';
import 'package:swift_rides/widgets/custom_button.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const CustomAppBar(title: 'Order Summary'),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 24),
            const SummaryItem(title: 'Name', value: 'Giorgano Williams'),
            const SummaryItem(title: 'Phone Number', value: '+12 3456 7890'),
            const SummaryItem(title: 'Email', value: 'giorgano12@gmail.com'),
            const SummaryItem(
                title: 'Address', value: '1234 Swift Street, Swift City'),
            const SummaryItem(title: 'Start Date', value: '25/10/2024'),
            const SummaryItem(title: 'End Date', value: '27/10/2024'),
            const Spacer(),
            const Divider(),
            const SizedBox(height: 16),
            const SummaryItem(
              title: 'Subtotal',
              value: '\$206.45',
              titleStyle: TextStyle(fontSize: 16),
              valueStyle: TextStyle(fontSize: 16),
            ),
            const SummaryItem(
              title: 'Tax',
              value: '\$20.6',
              titleStyle: TextStyle(fontSize: 16),
              valueStyle: TextStyle(fontSize: 16),
            ),
            const SummaryItem(
              title: 'Grand Total',
              value: '\$227.05',
              titleStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              valueStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => OrderScreen(),
                    ),
                  );
                },
                text: 'Pay Now',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
