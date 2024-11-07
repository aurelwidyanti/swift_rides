// auth_text_field.dart
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final VoidCallback? onSuffixIconTap;

  const AuthTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.onSuffixIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      height: 44,
      width: 360,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 237, 237, 237),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        textInputAction: textInputAction,
        keyboardType: keyboardType,
        validator: validator,
        decoration: InputDecoration(
            hintText: hintText,
            hintStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontSize: 15,
            ),
            suffixIcon: onSuffixIconTap != null
                ? GestureDetector(
                    onTap: onSuffixIconTap,
                    child: obscureText
                        ? const Icon(
                            Icons.visibility_off,
                            color: Colors.grey,
                            size: 22,
                          )
                        : const Icon(
                            Icons.visibility,
                            color: Colors.grey,
                            size: 22,
                          ),
                  )
                : null,
            border: InputBorder.none),
      ),
    );
  }
}
