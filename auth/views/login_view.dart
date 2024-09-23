import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:wahidstore/app/modules/auth/controllers/auth_controller.dart';
import 'package:wahidstore/app/modules/auth/views/forgetpass_view.dart';
import 'package:wahidstore/app/modules/widgets/appbar.dart';
import 'package:wahidstore/app/modules/widgets/custom_button.dart';
import 'package:wahidstore/app/modules/widgets/custom_text_field.dart';
import 'package:wahidstore/app/modules/widgets/medium_text_widgets.dart';
import 'package:wahidstore/app/modules/widgets/small_text_widgets.dart';
import 'package:wahidstore/constants/color_constant.dart';

import '../../widgets/TextFieldRow.dart';

class LoginView extends GetView<AuthController> {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'লগিন',
      ),
      body: Obx(() {
        return LoadingOverlay(
          isLoading: controller.authLoading.value,
          progressIndicator: const SpinKitDancingSquare(
            size: 40,
            color: primaryColor,
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const MediumTextStyle(
                      color: primaryColor,
                      text: 'লগিন ফরম',
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
                      controller: controller.emailController,
                      hintText: 'আপনার ফোন নম্বর /ইমেইল',
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
                        controller.tryToSignIn();
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(const ForgetpassView());
                      },
                      child: const SmallTextStyle(
                          color: secondaryColor,
                          text: 'পাসওয়ার্ড ভুলে গিয়েছেন ?',
                          fontSize: 18),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
