import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swift_rides/providers/booking_provider.dart';
import 'package:swift_rides/providers/user_provider.dart';
import 'package:swift_rides/views/order/widgets/summary_item.dart';
import 'package:swift_rides/widgets/custom_app_bar.dart';
import 'package:swift_rides/widgets/custom_button.dart';

class OrderScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer2<BookingProvider, UserProvider>(
      builder: (context, bookingProvider, userProvider, child) {
        final double totalPrice = bookingProvider.calculateTotalPrice();

        return totalPrice == 0
            ? const Center(child: Text('Failed to calculate total price'))
            : Scaffold(
                backgroundColor: Colors.white,
                appBar: const CustomAppBar(title: 'Order Summary'),
                body: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(height: 24),
                      SummaryItem(
                          title: 'Name', value: userProvider.user?.name),
                      SummaryItem(
                          title: 'Phone Number',
                          value: userProvider.user!.phone),
                      SummaryItem(
                          title: 'Drop Point', value: bookingProvider.address),
                      const Divider(height: 16, thickness: 0.5),
                      SummaryItem(title: 'Car', value: bookingProvider.car),
                      SummaryItem(
                          title: 'Price (/day)',
                          value: 'IDR ${bookingProvider.price ~/ 1000}K'),
                      SummaryItem(
                          title: 'Start Date',
                          value: bookingProvider.startDate.toString()),
                      SummaryItem(
                          title: 'End Date',
                          value: bookingProvider.endDate.toString()),
                      SummaryItem(
                          title: 'Duration',
                          value:
                              '${bookingProvider.endDate.difference(bookingProvider.startDate).inDays} days'),
                      const Spacer(),
                      const Divider(),
                      const SizedBox(height: 16),
                      SummaryItem(
                        title: 'Grand Total',
                        value: 'IDR ${totalPrice}',
                        titleStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        valueStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        width: double.infinity,
                        height: 44,
                        child: CustomButton(
                          onPressed: () async {
                            await bookingProvider.addBooking(context);
                          },
                          text: 'Pay Now',
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }
}
