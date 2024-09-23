import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahidstore/app/modules/auth/controllers/auth_controller.dart';

import '../../../../constants/color_constant.dart';
import '../../widgets/TextFieldRow.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/medium_text_widgets.dart';
import '../../widgets/small_text_widgets.dart';

class ForgetpassView extends GetView<AuthController> {
  const ForgetpassView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'পাসওয়ার্ড রিসেট',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const MediumTextStyle(
                  color: primaryColor,
                  text: 'পাসওয়ার্ড রিসেট ফরম',
                  fontSize: 30,
                ),
                SizedBox(height: Get.height * 0.02),
                Image.asset(
                  'assets/icons/mobile-password-forgot.png',
                  height: Get.height * 0.3,
                ),
                SizedBox(height: Get.height * 0.02),
                buildTextFieldRow(
                  label: 'ফোন/ইমেইল',
                  controller: controller.phoneController,
                  hintText: 'আপনার ফোন নম্বর /ইমেইল',
                ),
                SizedBox(height: Get.height * 0.02),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SmallTextStyle(
                      color: secondaryColor,
                      text: 'ওটিপিঃ',
                      fontSize: 20,
                    ),
                    Obx(
                      () => StylishTextFormField(
                        height: Get.height * .05,
                        width: Get.width * 0.6,
                        borderColor: primaryColor,
                        fillColor: Colors.white,
                        hintColor: Colors.grey,
                        hintText: 'আপনার পাসওয়ার্ড দিন',
                        obscure: !controller.isPasswordVisible.value,
                        controller: controller.passwordController,
                        suffixicon: IconButton(
                          icon: Icon(controller.isPasswordVisible.value
                              ? Icons.visibility
                              : Icons.visibility_off),
                          onPressed: () {
                            controller.isPasswordVisible.toggle();
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: Get.height * 0.05),
                StylishButton(
                  height: Get.height * 0.07,
                  width: Get.width * 0.8,
                  borderColor: primaryColor,
                  backgroundColor: secondaryColor,
                  textColor: Colors.white,
                  buttonText: 'সাবমিট করুন',
                  onPressed: () {
                    // Implement your validation logic here
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
