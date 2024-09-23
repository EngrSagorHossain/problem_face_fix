import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:wahidstore/app/modules/bottomnav/views/bottomnav_view.dart';
import 'package:wahidstore/app/modules/widgets/big_text_widgets.dart';
import 'package:wahidstore/constants/color_constant.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAll(const BottomnavView());
      // AuthController authController;
      // try {
      //   authController = Get.find();
      // } catch (e) {
      //   authController = Get.put(AuthController());
      // }
      // print(authController.token);
      // if (authController.token.value.isEmpty) {
      //   Get.off(LoginView());
      // } else {
      //   authController.token.value = authController.profile.value.token!;
      //   Get.offAll(const BetView());
      // }
    });
    return const Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: LargeTextStyle(
                color: secondaryColor, text: 'ওয়াহিদ স্টোর', fontSize: 35),
          ),
          SizedBox(
            height: 30,
          ),
          Center(
            child: SpinKitDualRing(
              color: Colors.pink,
              size: 40,
            ),
          ),
        ],
      ),
    );
  }
}
