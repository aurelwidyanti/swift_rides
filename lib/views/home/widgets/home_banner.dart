import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  final String image;

  const HomeBanner({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(24),
        ),
        image: DecorationImage(
          image: AssetImage(image),
          fit: BoxFit.cover,
        ),
        border: Border.all(
          color: const Color.fromARGB(255, 220, 220, 220),
          width: 1,
        ),
      ),
    );
  }
}
