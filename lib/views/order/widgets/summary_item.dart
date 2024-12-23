import 'package:flutter/material.dart';

class SummaryItem extends StatelessWidget {
  final String? title;
  final String? value;
  final TextStyle? titleStyle;
  final TextStyle? valueStyle;
  final EdgeInsetsGeometry? padding;
  final Widget? trailing;

  const SummaryItem({
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
                  fontSize: 15,
                  color: Colors.black54,
                ),
          ),
          Row(
            children: [
              Text(
                value ?? '',
                style: valueStyle ??
                    const TextStyle(
                      fontSize: 15,
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
