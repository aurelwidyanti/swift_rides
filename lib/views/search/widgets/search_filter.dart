import 'package:flutter/material.dart';

class SearchFilter extends StatelessWidget {
  const SearchFilter({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> carBrands = [
      'BMW',
      'Audi',
      'Mercedes',
      'Tesla',
      'Rolls-Royce'
    ];

    return Wrap(
      spacing: 8.0,
      alignment: WrapAlignment.start,
      children: carBrands.map((brand) {
        return FilterChip(
          label: Text(brand),
          onSelected: (bool value) {},
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        );
      }).toList(),
    );
  }
}
