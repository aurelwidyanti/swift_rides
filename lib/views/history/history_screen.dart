import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';
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
      body: const Padding(
        padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(top: 8),
            child: Column(
              children: [
                HistoryCard(
                    name: "BMW",
                    type: "M4 Competition M xDrive",
                    seat: 4,
                    price: 800,
                    totalcost: 1000),
                HistoryCard(
                    name: "BMW",
                    type: "M4 Competition M xDrive",
                    seat: 4,
                    price: 800,
                    totalcost: 1000),
                HistoryCard(
                    name: "BMW",
                    type: "M4 Competition M xDrive",
                    seat: 4,
                    price: 800,
                    totalcost: 1000),
                HistoryCard(
                    name: "BMW",
                    type: "M4 Competition M xDrive",
                    seat: 4,
                    price: 800,
                    totalcost: 1000),
                HistoryCard(
                    name: "BMW",
                    type: "M4 Competition M xDrive",
                    seat: 4,
                    price: 800,
                    totalcost: 1000),
                HistoryCard(
                    name: "BMW",
                    type: "M4 Competition M xDrive",
                    seat: 4,
                    price: 800,
                    totalcost: 1000),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
