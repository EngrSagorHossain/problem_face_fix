import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:wahidstore/api/end_points.dart';
import 'package:wahidstore/app/modules/auth/controllers/auth_controller.dart';
import 'package:wahidstore/app/modules/orders/views/orders_view.dart';
import 'package:wahidstore/app/modules/profile/views/pass_change_view.dart';
import 'package:wahidstore/app/modules/profile/views/updte_profile_view.dart';
import 'package:wahidstore/app/modules/widgets/appbar.dart';
import 'package:wahidstore/app/modules/widgets/big_text_widgets.dart';
import 'package:wahidstore/constants/color_constant.dart';

import '../../orders/controllers/orders_controller.dart';
import '../../widgets/button_with_icon.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'প্রোফাইল',
      ),
      body: Obx(() {
        return LoadingOverlay(
          isLoading: authController.authLoading.value,
          child: authController.token.value.isEmpty
              ? Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: Get.height * 0.4,
                      ),
                      const LargeTextStyle(
                        color: secondaryColor,
                        text: 'আপনার একাঊন্ট লগিন করা নাই।',
                        fontSize: 25,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      OutlinedButton.icon(
                        onPressed: () {
                          authController.tryToSignOut();
                          // Handle logout button press
                        },
                        icon: const Icon(Icons.logout, color: Colors.redAccent),
                        label: const Text('লগইন করুন',
                            style: TextStyle(
                                fontSize: 18, color: Colors.redAccent)),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          side: const BorderSide(
                              color: Colors.redAccent, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  // Center widget added here
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(100),
                        child: authController
                                    .profile.value.user!.profileImage ==
                                null
                            ? const Icon(
                                Icons.person,
                                size: 100,
                                color: Colors.grey, // Customize color if needed
                              )
                            : CachedNetworkImage(
                                imageUrl:
                                    '$imageUrl${authController.profile.value.user!.profileImage!}',
                                height: 100,
                                width: 100,
                                fit: BoxFit.contain,
                                placeholder: (context, url) =>
                                    const CircularProgressIndicator(),
                                // Optional: Add a placeholder while loading
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons
                                        .error), // Optional: Add an error widget
                              ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'নামঃ ${authController.profile.value.user!.ownerName!}',
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'ফোনঃ  ${authController.profile.value.user!.phone!}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'ইমেইলঃ  ${authController.profile.value.user!.email!}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      Text(
                        'ঠিকানাঃ  ${authController.profile.value.user!.address!}',
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 15),
                      ButtonWithIcon(
                        height: Get.height * 0.07,
                        width: Get.width * 0.8,
                        backgroundColor: Colors.white,
                        borderColor: primaryColor,
                        textColor: Colors.black,
                        buttonText: 'এড্রেস বুক',
                        onPressed: () {},
                        iconColor: Colors.black,
                        icone: Icons.book_online,
                      ),
                      const SizedBox(height: 15),
                      ButtonWithIcon(
                        height: Get.height * 0.07,
                        width: Get.width * 0.8,
                        backgroundColor: Colors.white,
                        borderColor: primaryColor,
                        textColor: Colors.black,
                        buttonText: 'Oder List',
                        onPressed: () {
                          Get.put(OrdersController());
                          Get.to(const OrdersView());
                        },
                        iconColor: Colors.black,
                        icone: Icons.list_alt,
                      ),
                      const SizedBox(height: 15),
                      ButtonWithIcon(
                        height: Get.height * 0.07,
                        width: Get.width * 0.8,
                        backgroundColor: Colors.white,
                        borderColor: primaryColor,
                        textColor: Colors.black,
                        buttonText: 'প্রোফাইল আপডেট',
                        onPressed: () {
                          Get.to(const ProfileUpdateView());
                        },
                        iconColor: Colors.black,
                        icone: Icons.person_remove_alt_1_outlined,
                      ),
                      const SizedBox(height: 15),
                      ButtonWithIcon(
                        height: Get.height * 0.07,
                        width: Get.width * 0.8,
                        backgroundColor: Colors.white,
                        borderColor: primaryColor,
                        textColor: Colors.black,
                        buttonText: 'পাসওয়ার্ড পরিবর্তন',
                        onPressed: () {
                          Get.to(const PasswordChangeView());
                        },
                        iconColor: Colors.black,
                        icone: Icons.book_online,
                      ),
                      const SizedBox(height: 15),
                      OutlinedButton.icon(
                        onPressed: () {
                          authController.tryToSignOut();
                          // Handle logout button press
                        },
                        icon: const Icon(Icons.login, color: Colors.redAccent),
                        label: const Text('লগ আউট করুন',
                            style: TextStyle(
                                fontSize: 18, color: Colors.redAccent)),
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15, horizontal: 25),
                          side: const BorderSide(
                              color: Colors.redAccent, width: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
        );
      }),
    );
  }
}
