import 'package:community_app/shared/themes/colors.dart';
import 'package:community_app/shared/themes/text_styles.dart';
import 'package:community_app/shared/utils/space.dart';
import 'package:flutter/material.dart';

class ProfileStats extends StatelessWidget {
  final String eventsCount;
  final String postsCount;
  final String followingCount;

  const ProfileStats({
    super.key,
    required this.eventsCount,
    required this.postsCount,
    required this.followingCount,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildStatItem(eventsCount, 'Events'),
          _buildStatItem(postsCount, 'Posts'),
          _buildStatItem(followingCount, 'Following'),
        ],
      ),
    );
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
}
