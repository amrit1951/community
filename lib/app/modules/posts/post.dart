import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/themes/colors.dart';
import '../../components/appbar.dart';
import '../../components/bottombar.dart';
import '../../components/drewar.dart';
import '../../routes/app_routes.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      drawer: Drawer(child: AppDrawer()),
      bottomNavigationBar: const AppBottombar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {
          Get.toNamed(AppRoutes.POST);
        },
        child: const Icon(
          Icons.add,
          color: AppColors.background,
        ),
        shape: const CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: const Center(
        child: Text("Posts"),
      ),
    );
  }
}
