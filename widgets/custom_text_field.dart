import 'package:flutter/material.dart';

class StylishTextFormField extends StatelessWidget {
  final double height;
  final double width;
  final Color borderColor;
  final Color fillColor;
  final Color hintColor;
  final String hintText;
  final bool? obscure;
  final TextEditingController? controller;
  final IconButton? suffixicon;

  const StylishTextFormField({
    super.key,
    required this.height,
    required this.width,
    required this.borderColor,
    required this.fillColor,
    required this.hintColor,
    required this.hintText,
    this.controller,
    this.obscure,
    this.suffixicon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        color: fillColor,
        borderRadius:
            BorderRadius.circular(12.0), // Customize border radius here
        border: Border.all(
          color: borderColor, // Customize border color here
          width: 2.0, // Customize border width here
        ),
      ),
      child: TextFormField(
        obscureText: obscure ?? false, // Default to false if obscure is null
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: suffixicon, // Handle null suffixicon
          hintText: hintText,
          hintStyle:
              TextStyle(color: hintColor), // Customize hint text color here
          border: InputBorder.none, // Removes the default border
          contentPadding: const EdgeInsets.symmetric(
              horizontal: 16.0, vertical: 12.0), // Customize padding here
        ),
      ),
    );
  }
}
