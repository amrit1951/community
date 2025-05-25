import 'package:community_app/app/routes/app_routes.dart';
import 'package:community_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarController extends GetxController {
  final RxInt currentIndex = 0.obs;

  void changeIndex(int index) {
    currentIndex.value = index;
  }

  void setIndexFromRoute(String route) {
    switch (route) {
      case AppRoutes.COMMUNITY:
        currentIndex.value = 0;
        break;
      case '/events':
        currentIndex.value = 1;
        break;
      case '/members':
        currentIndex.value = 2;
        break;
      case '/profile':
        currentIndex.value = 3;
        break;
    }
  }
}

class AppBottombar extends StatelessWidget {
  const AppBottombar({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BottomBarController());

    // Set initial index based on current route
    controller.setIndexFromRoute(Get.currentRoute);

    return Obx(() => BottomAppBar(
          height: 60,
          color: AppColors.secondary.withOpacity(0.3),
          shape: const CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.home,
                  color: controller.currentIndex.value == 0
                      ? AppColors.primary
                      : Colors.grey,
                ),
                onPressed: () {
                  controller.changeIndex(0);
                  Get.toNamed(AppRoutes.COMMUNITY);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.event,
                  color: controller.currentIndex.value == 1
                      ? AppColors.primary
                      : Colors.grey,
                ),
                onPressed: () {
                  controller.changeIndex(1);
                  Get.toNamed('/events');
                },
              ),
              // Empty space for the FloatingActionButton
              const SizedBox(width: 48),
              IconButton(
                icon: Icon(
                  Icons.people,
                  color: controller.currentIndex.value == 2
                      ? AppColors.primary
                      : Colors.grey,
                ),
                onPressed: () {
                  controller.changeIndex(2);
                  Get.toNamed('/members');
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.person,
                  color: controller.currentIndex.value == 3
                      ? AppColors.primary
                      : Colors.grey,
                ),
                onPressed: () {
                  controller.changeIndex(3);
                  Get.toNamed('/profile');
                },
              ),
            ],
          ),
        ));
  }
}
