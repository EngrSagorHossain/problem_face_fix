import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:wahidstore/app/modules/auth/controllers/auth_controller.dart';
import 'package:wahidstore/app/modules/widgets/loading_indicator.dart';

import '../../../../constants/color_constant.dart';
import '../../widgets/TextFieldRow.dart';
import '../../widgets/appbar.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/medium_text_widgets.dart';
import '../../widgets/small_text_widgets.dart';

class RegisterView extends GetView<AuthController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'লগিন',
      ),
      body: Obx(() {
        return LoadingOverlay(
          progressIndicator: const LoadingIndicator(),
          isLoading: controller.authLoading.value,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const MediumTextStyle(
                    color: primaryColor,
                    text: 'রেজিট্রেশন ফরম',
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
                          text: 'ছবি যোগ করুন',
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: Get.height * 0.07,
                    child: Obx(
                      () => DropdownButtonFormField<String>(
                        value: controller.selectedCustomerType.value,
                        decoration: const InputDecoration(
                          labelText: 'গ্রাহক প্রকার',
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor),
                          ),
                        ),
                        items: const [
                          DropdownMenuItem(
                            value: '1',
                            child: Text('কাস্টমার'),
                          ),
                          DropdownMenuItem(
                            value: 'agent',
                            child: Text('এজেন্ট'),
                          ),
                          DropdownMenuItem(
                            value: 'sr',
                            child: Text('সিনিয়র'),
                          ),
                        ],
                        onChanged: (value) {
                          controller.selectedCustomerType.value = value!;
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: Get.height * 0.02),
                  buildTextFieldRow(
                    label: 'দোকানের নামঃ',
                    controller: controller.shopNameController,
                    hintText: 'আপনার দোকানের নাম ',
                  ),
                  SizedBox(height: Get.height * 0.02),
                  buildTextFieldRow(
                    label: 'মালিকের নামঃ',
                    controller: controller.ownerNameController,
                    hintText: 'দোকানের মালিকের নাম',
                  ),
                  SizedBox(height: Get.height * 0.02),
                  buildTextFieldRow(
                    label: 'ঠিকানাঃ',
                    controller: controller.addressController,
                    hintText: 'আপনার দোকানের ঠিকানা ',
                  ),
                  SizedBox(height: Get.height * 0.02),
                  buildTextFieldRow(
                    label: 'ফোন নম্বরঃ',
                    controller: controller.phoneController,
                    hintText: 'আপনার ফোন নম্বর ',
                  ),
                  SizedBox(height: Get.height * 0.02),
                  buildTextFieldRow(
                    label: 'ইমেইল এড্রেসঃ',
                    controller: controller.emailController,
                    hintText: 'আপনার ইমেইল এড্রেস',
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SmallTextStyle(
                        color: secondaryColor,
                        text: 'পাসওয়ার্ডঃ',
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
                      controller.tryToSignUp();
                      // Implement your validation logic here
                    },
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
