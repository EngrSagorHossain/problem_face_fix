import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahidstore/app/modules/auth/controllers/auth_controller.dart';

import '../../../../constants/color_constant.dart';
import '../../widgets/TextFieldRow.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/medium_text_widgets.dart';
import '../../widgets/small_text_widgets.dart';

class ProfileUpdateView extends GetView<AuthController> {
  const ProfileUpdateView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'প্রোফাইল আপডেট',
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const MediumTextStyle(
                color: primaryColor,
                text: 'প্রোফাইল আপডেট করুন',
                fontSize: 30,
              ),
              Column(
                children: [
                  Obx(() => controller.selectedImage.value == null
                      ? Image.asset(
                          'assets/images/profile-picture.png',
                          height: Get.height * 0.15,
                        )
                      : Image.file(
                          File(controller.selectedImage.value!.path),
                          height: Get.height * 0.15,
                        )),
                  TextButton(
                    onPressed: controller.pickImage,
                    child: const SmallTextStyle(
                      color: secondaryColor,
                      text: 'ছবি পরিবর্তন করুন',
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02),
              buildTextFieldRow(
                label: 'নামঃ',
                controller: controller.ownerNameController,
                hintText: 'আপনার নাম',
              ),
              SizedBox(height: Get.height * 0.02),
              buildTextFieldRow(
                label: 'ঠিকানাঃ',
                controller: controller.addressController,
                hintText: 'আপনার ঠিকানা',
              ),
              SizedBox(height: Get.height * 0.02),
              buildTextFieldRow(
                label: 'ফোন নম্বরঃ',
                controller: controller.phoneController,
                hintText: 'আপনার ফোন নম্বর',
              ),
              SizedBox(height: Get.height * 0.02),
              buildTextFieldRow(
                label: 'ইমেইল এড্রেসঃ',
                controller: controller.emailController,
                hintText: 'আপনার ইমেইল এড্রেস',
              ),
              SizedBox(height: Get.height * 0.05),
              StylishButton(
                height: Get.height * 0.07,
                width: Get.width * 0.8,
                borderColor: primaryColor,
                backgroundColor: secondaryColor,
                textColor: Colors.white,
                buttonText: 'আপডেট করুন',
                onPressed: () {
                  // Implement your update logic here
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
