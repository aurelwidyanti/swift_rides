import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:provider/provider.dart';
import 'package:swift_rides/models/booking_model.dart';
import 'package:swift_rides/providers/booking_provider.dart';
import 'package:swift_rides/views/history/history_filter_screen.dart';
import 'package:swift_rides/widgets/custom_app_bar.dart';
import 'package:swift_rides/views/history/widgets/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "History",
        showBackButton: false,
        backgroundColor: const Color.fromRGBO(23, 93, 227, 1),
        textColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const HistoryFilterScreen(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(1.0, 0.0);
                    const end = Offset.zero;
                    const curve = Curves.easeInOut;

                    var tween = Tween(begin: begin, end: end)
                        .chain(CurveTween(curve: curve));
                    var offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            icon: const HugeIcon(
              icon: HugeIcons.strokeRoundedFilterVertical,
              color: Colors.white,
              size: 24.0,
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Consumer<BookingProvider>(
            builder: (context, bookingProvider, child) {
          final List<Booking> bookings = bookingProvider.bookings;

          if (bookingProvider.isFetching) {
            return const Center(child: CircularProgressIndicator());
          }
          return bookings.isEmpty
              ? const Center(child: Text('No bookings found'))
              : Padding(
                  padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 8),
                    itemCount: bookings.length,
                    itemBuilder: (context, index) {
                      final booking = bookings[index];
                      return HistoryCard(
                        name: booking.car!.name!,
                        type: booking.car!.type!,
                        seat: booking.car!.seat!.toDouble(),
                        price: booking.car!.price!.toDouble(),
                        totalcost: booking.totalPrice!.toDouble(),
                      );
                    },
                  ),
                );
        }),
      ),
    );
  }
}
