import 'package:flutter/material.dart';

class ProfileDetail extends StatelessWidget {
  final String? title;
  final String? value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? trailing;

  const ProfileDetail({
    Key? key,
    this.title,
    this.value,
    this.titleStyle,
    this.valueStyle,
    this.padding,
    this.trailing,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title ?? '',
            style: titleStyle ??
                const TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                ),
          ),
          Row(
            children: [
              Text(
                value ?? '',
                style: valueStyle ??
                    const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
              ),
              if (trailing != null) trailing!,
            ],
          ),
        ],
      ),
    );
  }
}
