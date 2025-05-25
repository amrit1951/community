import 'package:community_app/app/components/appbar.dart';
import 'package:community_app/app/components/bottombar.dart';
import 'package:community_app/app/components/drewar.dart';
import 'package:community_app/app/modules/community/widgets/community_widgets.dart';
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner Section
            Stack(
              children: [
                Container(
                  height: 200,
                  width: Get.width,
                  child: Image.asset(
                    'assets/images/cmt_banner1.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  height: 200,
                  width: Get.width,
                  color: Colors.black.withOpacity(0.4),
                  child: const Center(
                    child: Text(
                      'Welcome to Our Community',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            // space(height: 20),

            // Why Join Us Section
            CommunityWidgets.buildWhyJoinUs(),
            space(height: 30),

            // Quick Stats Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CommunityWidgets.buildStatItem('1.2K', 'Members'),
                  CommunityWidgets.buildStatItem('50+', 'Events'),
                  CommunityWidgets.buildStatItem('100+', 'Posts'),
                ],
              ),
            ),
            space(height: 30),

            // Upcoming Events Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Upcoming Events',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primary,
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'View All',
                          style: TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  space(height: 16),
                  CommunityWidgets.buildEventCard(
                    'Community Meetup 2024',
                    'Join us for our annual community gathering',
                    'March 15, 2024 • 2:00 PM',
                    'assets/images/cmt_banner1.jpg',
                    'Virtual Event',
                  ),
                  space(height: 16),
                  CommunityWidgets.buildEventCard(
                    'Tech Workshop',
                    'Learn the latest in technology trends',
                    'March 20, 2024 • 10:00 AM',
                    'assets/images/cmt_banner1.jpg',
                    'In-Person',
                  ),
                  space(height: 16),
                  CommunityWidgets.buildEventCard(
                    'Networking Session',
                    'Connect with industry professionals',
                    'March 25, 2024 • 6:00 PM',
                    'assets/images/cmt_banner1.jpg',
                    'Hybrid',
                  ),
                ],
              ),
            ),
            space(height: 30),

            // Community Categories
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.grey[100],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Explore Categories',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  space(height: 16),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        CommunityWidgets.buildCategoryItem(
                            'Business', Icons.business),
                        CommunityWidgets.buildCategoryItem(
                            'Technology', Icons.computer),
                        CommunityWidgets.buildCategoryItem(
                            'Education', Icons.school),
                        CommunityWidgets.buildCategoryItem(
                            'Health', Icons.health_and_safety),
                        CommunityWidgets.buildCategoryItem(
                            'Arts', Icons.palette),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            space(height: 30),

            // Community Guidelines Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Community Guidelines',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  space(height: 16),
                  CommunityWidgets.buildGuidelineItem(
                      'Be respectful to all members'),
                  CommunityWidgets.buildGuidelineItem('Share valuable content'),
                  CommunityWidgets.buildGuidelineItem('Follow community rules'),
                ],
              ),
            ),
            space(height: 30),

            // Join Community Section
            Container(
              padding: const EdgeInsets.all(24),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  const Text(
                    'Join Our Growing Community',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                  space(height: 16),
                  Text(
                    'Connect with like-minded individuals and grow together',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  space(height: 20),
                  CustomButton(
                    label: "Join Now",
                    onPressed: () {
                      Get.toNamed(AppRoutes.LOGIN);
                    },
                  ),
                ],
              ),
            ),
            space(height: 30),
          ],
        ),
      ),
    );
  }
}
