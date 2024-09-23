import 'package:flutter/cupertino.dart';

class MediumTextStyle extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;

  const MediumTextStyle({
    super.key,
    required this.color,
    required this.text,
    required this.fontSize,
    this.fontWeight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color,
      ),
    );
  }
}
