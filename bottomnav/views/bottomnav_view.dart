import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_bottom_nav_bar.dart';
import 'package:wahidstore/app/modules/auth/controllers/auth_controller.dart';
import 'package:wahidstore/app/modules/cart/views/cart_view.dart';
import 'package:wahidstore/app/modules/home/views/home_view.dart';
import 'package:wahidstore/app/modules/messanger/views/message_list_view.dart';
import 'package:wahidstore/app/modules/messanger/views/messanger_view.dart';
import 'package:wahidstore/app/modules/orders/controllers/orders_controller.dart';
import 'package:wahidstore/app/modules/orders/views/orders_view.dart';
import 'package:wahidstore/app/modules/profile/views/profile_view.dart';
import 'package:wahidstore/constants/color_constant.dart';

import '../controllers/bottomnav_controller.dart';

class BottomnavView extends GetView<BottomnavController> {
  const BottomnavView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get.put(CartController());
    Get.put(OrdersController());
    PersistentTabController _controller =
        PersistentTabController(initialIndex: 0);

    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      handleAndroidBackButtonPress: true,
      resizeToAvoidBottomInset: true,
      stateManagement: true,
      hideNavigationBarWhenKeyboardAppears: true,
      padding: const EdgeInsets.only(top: 8, bottom: 8),
      backgroundColor: primaryColor,
      isVisible: true,
      animationSettings: const NavBarAnimationSettings(
        navBarItemAnimation: ItemAnimationSettings(
          duration: Duration(milliseconds: 400),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimationSettings(
          animateTabTransition: true,
          duration: Duration(milliseconds: 200),
          screenTransitionAnimationType: ScreenTransitionAnimationType.fadeIn,
        ),
      ),
      confineToSafeArea: true,
      navBarHeight: 70.0,
      // Increased height of the bottom navigation bar
      navBarStyle: NavBarStyle.style6,
    );
  }

  List<Widget> _buildScreens() {
    AuthController authController = Get.find();
    return [
      const HomeView(),
      // Check if the user is an admin (user ID 1)
      authController.token.isNotEmpty
          ? authController.profile.value.user!.id == 1
              ? MessageListView() // Show MessageListView for admin
              : const MessangerView()
          : const MessangerView(),
      // Show MessangerView for regular users
      const OrdersView(),
      const CartView(),
      const ProfileView(),
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.home, size: 40),
        title: "হোম",
        activeColorPrimary: Colors.white, // Icon and text color when selected
        inactiveColorPrimary:
            Colors.white, // Icon and text color when not selected
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.inbox_outlined,
          size: 40,
        ),
        title: "ইনবক্স",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(
          Icons.list_alt,
          size: 40,
        ),
        title: 'অডার',
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.add_shopping_cart, size: 40),
        title: "কার্ট",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
      PersistentBottomNavBarItem(
        icon: const Icon(Icons.person, size: 40),
        title: "প্রোফাইল",
        activeColorPrimary: Colors.white,
        inactiveColorPrimary: Colors.white,
      ),
    ];
  }
}
