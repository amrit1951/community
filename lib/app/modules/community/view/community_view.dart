import 'package:community_app/app/components/appbar.dart';
import 'package:community_app/app/components/bottombar.dart';
import 'package:community_app/app/components/drewar.dart';
import 'package:community_app/app/routes/app_routes.dart';
import 'package:community_app/shared/themes/colors.dart';
import 'package:community_app/shared/utils/space.dart';
import 'package:community_app/shared/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CommunityView extends StatefulWidget {
  const CommunityView({super.key});

  @override
  State<CommunityView> createState() => _CommunityViewState();
}

class _CommunityViewState extends State<CommunityView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appbar(),
      drawer: Drawer(child: AppDrawer()),
      bottomNavigationBar: AppBottombar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
        child: Icon(
          Icons.add,
          color: AppColors.background,
        ),
        shape: CircleBorder(),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Container(
        height: Get.height,
        width: Get.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              child: Image.asset('assets/images/cmt_banner1.jpg'),
            ),
            space(height: 20),
            CustomButton(
                label: "LogIn",
                onPressed: () {
                  Get.offNamed(AppRoutes.LOGIN);
                })
          ],
        ),
        // color: Colors.amber,
      ),
    );
  }
}
