import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class HistoryCard extends StatelessWidget {
  final String name;
  final String type;
  final double seat;
  final double price;
  final double totalcost;
  // final Function onTap;

  const HistoryCard({
    super.key,
    required this.name,
    required this.type,
    required this.seat,
    required this.price,
    required this.totalcost,
    // required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () => onTap(),
      child: Card(
        color: Colors.white,
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.14,
                    ),
                  ),
                  Text(
                    type,
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.14,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  Row(
                    children: [
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedSeatSelector,
                        color: Colors.black,
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      Text(
                        seat.toStringAsFixed(0),
                        style: const TextStyle(
                          color: Color.fromRGBO(178, 176, 176, 1),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.14,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 40),
                  Row(
                    children: [
                      const HugeIcon(
                        icon: HugeIcons.strokeRoundedDollarCircle,
                        color: Colors.black,
                        size: 22,
                      ),
                      const SizedBox(width: 8),
                      RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'IDR ${price.toStringAsFixed(0)}K',
                              style: const TextStyle(
                                color: Color.fromRGBO(178, 176, 176, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.14,
                              ),
                            ),
                            const TextSpan(
                              text: '/day',
                              style: TextStyle(
                                color: Color.fromRGBO(178, 176, 176, 1),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Text(
                    "Total Cost : ",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 0.14,
                    ),
                  ),
                  Text(
                    'IDR ${totalcost.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Color.fromRGBO(20, 168, 60, 1),
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.14,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
