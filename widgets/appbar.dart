import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wahidstore/app/modules/auth/controllers/auth_controller.dart';
import 'package:wahidstore/app/modules/widgets/big_text_widgets.dart';
import 'package:wahidstore/constants/color_constant.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onDrawerPressed;
  final Color backgroundColor;
  final Color titleColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.onDrawerPressed,
    this.backgroundColor = Colors.blue,
    this.titleColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.find();
    return AppBar(
      leading: IconButton(
        icon: Icon(
          Icons.menu,
          color: titleColor,
          size: 40,
        ),
        onPressed: () {
          authController.openDrawer();
        },
      ),
      title: LargeTextStyle(
        color: secondaryColor,
        text: title,
        fontSize: 28,
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(
            Icons.notifications,
            color: titleColor,
            size: 40,
          ),
          onPressed: () {
            // Handle notification button press
          },
        ),
      ],
      backgroundColor: primaryColor,
      elevation: 4.0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
