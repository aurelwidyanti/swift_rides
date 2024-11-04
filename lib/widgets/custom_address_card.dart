import 'package:flutter/material.dart';

class CustomAddressCard extends StatelessWidget {
  final String title;
  final String addressStreet;
  final String addressCity;
  final bool isSelected;
  final VoidCallback onSelect;

  const CustomAddressCard({
    super.key,
    required this.title,
    required this.addressStreet,
    required this.addressCity,
    this.isSelected = false,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border:
            Border.all(color: const Color.fromRGBO(180, 180, 180, 1), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(16),
              bottomLeft: Radius.circular(16),
            ),
            child: Image.asset(
              'assets/img/map.png',
              fit: BoxFit.fitHeight,
              width: 100,
              height: double.infinity,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(35, 35, 35, 1)),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    addressStreet.length > 25 ? '${addressStreet.substring(0, 25)}...' : addressStreet,
                    style: const TextStyle(
                      fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(35, 35, 35, 1)),
                  ),
                  Text(
                    addressCity,
                    style: const TextStyle(
                      fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(35, 35, 35, 1)),
                  ),
                ],
              ),
            ),
          ),
          Radio(
            value: true,
            groupValue: isSelected,
            onChanged: (value) => onSelect(),
          ),
        ],
      ),
    );
  }
}
