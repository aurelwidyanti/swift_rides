import 'package:flutter/material.dart';

class CustomDotIndicator extends StatelessWidget {
  final bool isActive;
  final Color activeColor, inActiveColor;

  const CustomDotIndicator({
    super.key,
    this.isActive = false,
    this.activeColor = const Color(0xFF3B3B3B),
    this.inActiveColor = const Color(0xFF868686),
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8,
      width: isActive ? 18 : 8,
      decoration: BoxDecoration(
        color: isActive ? activeColor : inActiveColor.withOpacity(0.25),
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
