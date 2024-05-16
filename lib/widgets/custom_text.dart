import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    super.key,
    required this.text,
    this.color,
    this.fontSize,
    this.fontWeight,
  });

  final String text;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? const Color.fromRGBO(24, 23, 37, 1),
        fontSize: fontSize ?? 16,
        fontWeight: fontWeight ?? FontWeight.w500,
        letterSpacing: 0,
      ),
    );
  }
}
