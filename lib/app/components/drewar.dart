import 'package:community_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppDrawer extends StatelessWidget {
  AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Drawer Header
        DrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [AppColors.primary, AppColors.primary.withOpacity(0.8)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: SizedBox(
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    image: const DecorationImage(
                      image: AssetImage('assets/icon/icon.png'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Welcome',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Drawer Items (Main Navigation - same as bottom bar)
        ListTile(
          leading: Icon(Icons.home, color: AppColors.primary),
          title: const Text(
            'Home',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            Get.toNamed('/home-screen');
          },
          // selected: _mainScreenController.currentIndex.value == 0,
          selectedTileColor: Colors.grey.withOpacity(0.1),
        ),
        Divider(height: 1, color: Colors.grey.withOpacity(0.3)),

        ListTile(
          leading: SizedBox(
            height: 20,
            width: 20,
            child: Image.asset(
              "assets/icon/services.png",
              fit: BoxFit.fill,
              color: AppColors.primary,
            ),
          ),
          title: const Text(
            'Services',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          onTap: () {
            Get.toNamed('/service');
          },
          // selected: _mainScreenController.currentIndex.value == 1,
          selectedTileColor: Colors.grey.withOpacity(0.1),
        ),

        Divider(height: 1, color: Colors.grey.withOpacity(0.3)),

        // Spacer to push the version number to bottom
        Expanded(child: Container()),

        // Version number at bottom
        const Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'Version 1.0.0',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
