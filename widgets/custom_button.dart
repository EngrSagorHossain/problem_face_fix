import 'package:flutter/material.dart';

class StylishButton extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String buttonText;
  final VoidCallback onPressed;
  final double? fontSize;

  const StylishButton(
      {super.key,
      required this.height,
      required this.width,
      required this.backgroundColor,
      required this.borderColor,
      required this.textColor,
      required this.buttonText,
      required this.onPressed,
      this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: textColor,
          backgroundColor: backgroundColor, // Customize text color here
          padding: EdgeInsets.zero, // Remove default padding
          side: BorderSide(
              color: borderColor,
              width: 2.0), // Customize border color and width
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: fontSize ?? 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
