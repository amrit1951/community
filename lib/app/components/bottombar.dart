import 'package:community_app/app/routes/app_routes.dart';
import 'package:community_app/shared/themes/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottombar extends StatefulWidget {
  const AppBottombar({super.key});

  @override
  State<AppBottombar> createState() => _AppBottombarState();
}

class _AppBottombarState extends State<AppBottombar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      color: AppColors.secondary.withOpacity(0.3),
      shape: const CircularNotchedRectangle(),
      notchMargin: 6.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          IconButton(icon: const Icon(Icons.home), onPressed: () {}),
          IconButton(icon: const Icon(Icons.event), onPressed: () {}),
          // Empty space for the FloatingActionButton
          const SizedBox(width: 48),
          IconButton(
              icon: const Icon(Icons.people),
              onPressed: () {
                Get.toNamed('/members');
              }),
          IconButton(icon: const Icon(Icons.person), onPressed: () {}),
        ],
      ),
    );
  }
}
