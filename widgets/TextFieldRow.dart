import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahidstore/app/modules/widgets/small_text_widgets.dart';

import '../../../constants/color_constant.dart';
import 'custom_text_field.dart';

Widget buildTextFieldRow({
  required String label,
  required TextEditingController controller,
  required String hintText,
}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      SmallTextStyle(
        color: secondaryColor,
        text: label,
        fontSize: 20,
      ),
      const SizedBox(width: 10),
      StylishTextFormField(
        height: Get.height * .05,
        width: Get.width * 0.6,
        borderColor: primaryColor,
        fillColor: Colors.white,
        hintColor: Colors.grey,
        hintText: hintText,
        controller: controller,
      ),
    ],
  );
}
