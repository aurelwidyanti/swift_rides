import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CarCard extends StatelessWidget {
  final String imageUrl;
  final String name;
  final String type;
  final double price;
  final double rating;

  const CarCard(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.type,
      required this.price,
      required this.rating});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Icon(
                  CupertinoIcons.star_fill,
                  color: Colors.yellow,
                  size: 16,
                ),
                const SizedBox(width: 4),
                Text(
                  ('${rating.toStringAsFixed(1)}/5.0'),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    fontSize: 14,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(226, 236, 243, 1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Available',
                    style: TextStyle(
                      color: Color.fromRGBO(23, 93, 227, 1),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ],
            ),
            Image.asset(imageUrl),
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
                Text('\$${price.toStringAsFixed(2)} per day'),
              ],
            ),
            ButtonBar(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/car-detail');
                  },
                  child: const Text('Details'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/booking');
                  },
                  child: const Text('Rent Now'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
