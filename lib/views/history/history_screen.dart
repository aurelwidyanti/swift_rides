import 'package:flutter/material.dart';
import 'package:swift_rides/widgets/custom_app_bar.dart';
import 'package:swift_rides/views/history/widgets/history_card.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(title: "History"),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              HistoryCard(name: "BMW", seat: 4, price: 800, totalcost: 1000),
              HistoryCard(name: "BMW", seat: 4, price: 800, totalcost: 1000),
              HistoryCard(name: "BMW", seat: 4, price: 800, totalcost: 1000),
              HistoryCard(name: "BMW", seat: 4, price: 800, totalcost: 1000),
              HistoryCard(name: "BMW", seat: 4, price: 800, totalcost: 1000),
            ],
          ),
        ),
      ),
    );
  }
}
