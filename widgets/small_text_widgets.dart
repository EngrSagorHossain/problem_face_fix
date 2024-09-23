import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';

class SmallTextStyle extends StatelessWidget {
  final Color color;
  final String text;
  final double fontSize;
  final FontWeight? fontWeight;

  const SmallTextStyle({
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
      style: GoogleFonts.tiroBangla(
        fontSize: fontSize,
        fontWeight: fontWeight ?? FontWeight.bold,
        color: color,
      ),
    );
  }
}
