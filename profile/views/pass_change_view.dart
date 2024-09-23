import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahidstore/app/modules/auth/controllers/auth_controller.dart';

import '../../../../constants/color_constant.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/medium_text_widgets.dart';

class PasswordChangeView extends GetView<AuthController> {
  const PasswordChangeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'পাসওয়ার্ড পরিবর্তন',
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MediumTextStyle(
                  color: primaryColor,
                  text: 'পাসওয়ার্ড পরিবর্তন ফরম',
                  fontSize: 30,
                ),
                SizedBox(height: Get.height * 0.02),
                Obx(
                  () => StylishTextFormField(
                    height: Get.height * .05,
                    width: Get.width * 0.8,
                    borderColor: primaryColor,
                    fillColor: Colors.white,
                    hintColor: Colors.grey,
                    hintText: 'বর্তমান পাসওয়ার্ড দিন',
                    obscure: !controller.isCurrentPasswordVisible.value,
                    controller: controller.currentPasswordController,
                    suffixicon: IconButton(
                      icon: Icon(controller.isCurrentPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        controller.isCurrentPasswordVisible.toggle();
                      },
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Obx(
                  () => StylishTextFormField(
                    height: Get.height * .05,
                    width: Get.width * 0.8,
                    borderColor: primaryColor,
                    fillColor: Colors.white,
                    hintColor: Colors.grey,
                    hintText: 'নতুন পাসওয়ার্ড দিন',
                    obscure: !controller.isNewPasswordVisible.value,
                    controller: controller.newPasswordController,
                    suffixicon: IconButton(
                      icon: Icon(controller.isNewPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        controller.isNewPasswordVisible.toggle();
                      },
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.02),
                Obx(
                  () => StylishTextFormField(
                    height: Get.height * .05,
                    width: Get.width * 0.8,
                    borderColor: primaryColor,
                    fillColor: Colors.white,
                    hintColor: Colors.grey,
                    hintText: 'নতুন পাসওয়ার্ড নিশ্চিত করুন',
                    obscure: !controller.isConfirmPasswordVisible.value,
                    controller: controller.confirmPasswordController,
                    suffixicon: IconButton(
                      icon: Icon(controller.isConfirmPasswordVisible.value
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        controller.isConfirmPasswordVisible.toggle();
                      },
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.05),
                StylishButton(
                  height: Get.height * 0.07,
                  width: Get.width * 0.8,
                  borderColor: primaryColor,
                  backgroundColor: secondaryColor,
                  textColor: Colors.white,
                  buttonText: 'পাসওয়ার্ড পরিবর্তন করুন',
                  onPressed: () {
                    // Implement your password change logic here
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
