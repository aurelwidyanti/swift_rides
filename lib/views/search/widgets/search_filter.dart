import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> carCategories = [
      {'label': 'Cabriolet', 'image': 'assets/img/car-types/cabriolet.png'},
      {'label': 'Coupe', 'image': 'assets/img/car-types/coupe.png'},
      {'label': 'SUV', 'image': 'assets/img/car-types/cuv.png'},
      {'label': 'Hatchback', 'image': 'assets/img/car-types/hatchback.png'},
      {'label': 'Micro', 'image': 'assets/img/car-types/micro.png'},
      {'label': 'Pickup', 'image': 'assets/img/car-types/pickup.png'},
      {'label': 'Sedan', 'image': 'assets/img/car-types/sedan.png'},
      {'label': 'Supercar', 'image': 'assets/img/car-types/supercar.png'},
    ];

    final uniqueCategories = carCategories.toSet().toList();

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: uniqueCategories.map((category) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.44,
          height: 150,
          child: InkWell(
            onTap: () {},
            child: Card(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
                side: const BorderSide(
                  color: Color.fromARGB(255, 220, 220, 220),
                  width: 1,
                ),
              ),
              elevation: 1,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
                child: Column(
                  children: [
                    Image.asset(
                      category['image']!,
                      width: double.infinity,
                      height: 80,
                      fit: BoxFit.fitWidth,
                    ),
                    Text(
                      category['label']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
