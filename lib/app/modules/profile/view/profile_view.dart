import 'package:community_app/app/components/appbar.dart';
import 'package:community_app/app/components/bottombar.dart';
import 'package:community_app/app/components/drewar.dart';
import 'package:community_app/app/controller/profile_controller.dart';
import 'package:community_app/shared/themes/colors.dart';
import 'package:community_app/shared/themes/text_styles.dart';
import 'package:community_app/shared/utils/space.dart';
import 'package:community_app/shared/widgets/btn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      appBar: appbar(),
      drawer: Drawer(child: AppDrawer()),
      bottomNavigationBar: const AppBottombar(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primary,
        onPressed: () {},
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
            // Profile Header
            Container(
              height: 200,
              width: Get.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    AppColors.primary,
                    AppColors.primary.withOpacity(0.8),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Obx(() => Container(
                        width: 100,
                        height: 100,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                          image: DecorationImage(
                            image: AssetImage(controller.profileImage.value),
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                  space(height: 16),
                  Obx(() => Text(
                        controller.name.value,
                        style: B24.copyWith(color: Colors.white),
                      )),
                  space(height: 4),
                  Obx(() => Text(
                        controller.email.value,
                        style:
                            N16.copyWith(color: Colors.white.withOpacity(0.8)),
                      )),
                ],
              ),
            ),

            // Quick Stats
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Obx(() => _buildStatItem(
                        controller.eventsCount.value.toString(),
                        'Events',
                      )),
                  Obx(() => _buildStatItem(
                        controller.postsCount.value.toString(),
                        'Posts',
                      )),
                  Obx(() => _buildStatItem(
                        controller.followingCount.value.toString(),
                        'Following',
                      )),
                ],
              ),
            ),

            // Profile Sections
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // About Section
                  Text(
                    'About',
                    style: B20.copyWith(color: AppColors.primary),
                  ),
                  space(height: 12),
                  Obx(() => Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 1,
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Text(
                          controller.about.value,
                          style: N16.copyWith(color: Colors.grey[800]),
                        ),
                      )),
                  space(height: 24),

                  // Recent Activity
                  Text(
                    'Recent Activity',
                    style: B20.copyWith(color: AppColors.primary),
                  ),
                  space(height: 12),
                  Obx(() => Column(
                        children: controller.recentActivities
                            .map((activity) => _buildActivityItem(
                                  activity['title'],
                                  activity['time'],
                                  _getIconData(activity['icon']),
                                ))
                            .toList(),
                      )),
                  space(height: 24),

                  // Skills & Interests
                  Text(
                    'Skills & Interests',
                    style: B20.copyWith(color: AppColors.primary),
                  ),
                  space(height: 12),
                  Obx(() => Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: controller.skills
                            .map((skill) => _buildSkillChip(skill))
                            .toList(),
                      )),
                  space(height: 24),

                  // Edit Profile Button
                  Center(
                    child: CustomButton(
                      label: "Edit Profile",
                      onPressed: () {
                        // Navigate to edit profile
                      },
                    ),
                  ),
                  space(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'event':
        return Icons.event;
      case 'forum':
        return Icons.forum;
      case 'group':
        return Icons.group;
      default:
        return Icons.info;
    }
  }

  Widget _buildStatItem(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: B24.copyWith(color: AppColors.primary),
        ),
        space(height: 4),
        Text(
          label,
          style: N14.copyWith(color: Colors.grey[600]),
        ),
      ],
    );
  }

  Widget _buildActivityItem(String title, String time, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 20,
            ),
          ),
          space(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: B16,
                ),
                space(height: 4),
                Text(
                  time,
                  style: N14.copyWith(color: Colors.grey[600]),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSkillChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: N14.copyWith(
          color: AppColors.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
