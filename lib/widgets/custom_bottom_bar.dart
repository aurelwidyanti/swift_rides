import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

class CustomBottomBar extends StatelessWidget {
  const CustomBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.white,
      shape: const CircularNotchedRectangle(),
      elevation: 4,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 1,
              offset: const Offset(0, -1),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            HugeIcon(
              icon: HugeIcons.strokeRoundedHome13,
              color: Colors.blue,
              size: 20,
            ),
            HugeIcon(
              icon: HugeIcons.strokeRoundedSearch01,
              color: Colors.blue,
              size: 20,
            ),
            HugeIcon(
              icon: HugeIcons.strokeRoundedArrowReloadHorizontal,
              color: Colors.blue,
              size: 20,
            ),
            HugeIcon(
              icon: HugeIcons.strokeRoundedUser,
              color: Colors.blue,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }
}
