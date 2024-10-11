import 'package:flutter/material.dart';

class CarCard extends StatelessWidget {
  final String name;
  final String imageUrl;
  final double price;

  CarCard({required this.name, required this.imageUrl, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(imageUrl),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              name,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text('\$${price.toStringAsFixed(2)} per day'),
          ),
          ButtonBar(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/car-detail');
                },
                child: Text('Details'),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/booking');
                },
                child: Text('Rent Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
