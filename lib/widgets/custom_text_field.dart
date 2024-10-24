import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? suffixIcon;
  final bool obscureText;
  final TextEditingController? controller;

  const CustomTextField({
    Key? key,
    required this.hintText,
    this.suffixIcon,
    this.obscureText = false,
    this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
      height: 48,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: Colors.grey.shade400,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              obscureText: obscureText,
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.grey.shade500,
                  fontSize: 16,
                ),
                border: InputBorder.none,
                suffixIcon: suffixIcon != null
                    ? Icon(suffixIcon, color: Colors.grey.shade500)
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
