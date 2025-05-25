import 'package:community_app/shared/themes/colors.dart';
import 'package:community_app/shared/themes/text_styles.dart';
import 'package:community_app/shared/utils/space.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

appbar() {
  return AppBar(
    toolbarHeight: 60,
    centerTitle: true,
    elevation: 4,
    shadowColor: Colors.black26,
    backgroundColor: AppColors.primary.withOpacity(0.8),
    // leading: Drawer(),
    title: Center(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset("assets/icons/c_logo.png", height: 50),
          SizedBox(
            width: 0,
          ),
          Text(
            "Community",
            style: B20.copyWith(color: AppColors.background),
          ),
          space(width: 10)
        ],
      ),
    ),
    actions: [
      Row(
        children: [
          IconButton(
            icon:
                // Badge.count(
                // count: notificationController.unreadCount.value,
                Icon(
              Icons.notifications,
              color: AppColors.background,
            ),
            // ),
            onPressed: () {
              Get.toNamed('/notification-screen');
            },
          ),
        ],
      ),
    ],
  );
}
