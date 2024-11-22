// auth_text_field.dart
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final String labelText;
  final bool obscureText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final FocusNode? focusNode;
  final VoidCallback? onSuffixIconTap;

  const AuthTextField({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.labelText,
    this.obscureText = false,
    this.textInputAction = TextInputAction.done,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.focusNode,
    this.onSuffixIconTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 15,
          ),
        ),
        const SizedBox(height: 8),
        Container(
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
            focusNode: focusNode,
            scrollPadding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom + 200),
            decoration: InputDecoration(
                hintText: hintText,
                hintStyle: const TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w400,
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
        ),
      ],
    );
  }
}
