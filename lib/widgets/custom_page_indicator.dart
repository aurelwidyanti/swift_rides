import 'package:flutter/material.dart';
import 'package:swift_rides/widgets/custom_dot_indicator.dart';

class CustomPageIndicator extends StatelessWidget {
  final int pageLength;
  final int currentIndexPage;

  const CustomPageIndicator({
    super.key,
    required this.pageLength,
    required this.currentIndexPage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        pageLength,
        (index) {
          return CustomDotIndicator(
            isActive: index == currentIndexPage,
          );
        },
      ),
    );
  }
}
