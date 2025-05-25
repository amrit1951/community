import 'package:community_app/shared/themes/colors.dart';
import 'package:community_app/shared/utils/space.dart';
import 'package:flutter/material.dart';

import '../../../../shared/themes/text_styles.dart';

class CommunityWidgets {
  static Widget buildStatItem(String value, String label) {
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

  static Widget buildEventCard(
    String title,
    String description,
    String dateTime,
    String imagePath,
    String eventType,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.asset(
                  imagePath,
                  height: 150,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: eventType == 'Virtual Event'
                        ? Colors.blue.withOpacity(0.9)
                        : eventType == 'In-Person'
                            ? Colors.green.withOpacity(0.9)
                            : Colors.purple.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    eventType,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: B18),
                space(height: 8),
                Text(
                  description,
                  style: N14.copyWith(color: Colors.grey[600]),
                ),
                space(height: 12),
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: AppColors.primary,
                    ),
                    space(width: 8),
                    Text(
                      dateTime,
                      style: N14.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                space(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Free Entry',
                      style: N16.copyWith(
                          color: Colors.green, fontWeight: FontWeight.w600),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Register Now',
                        style: N14
                            .copyWith(color: Colors.white)
                            .copyWith(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildCategoryItem(String title, IconData icon) {
    return Container(
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
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
          Icon(icon, color: AppColors.primary),
          space(width: 8),
          Text(
            title,
            style: N16.copyWith(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  static Widget buildGuidelineItem(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: AppColors.primary,
            size: 20,
          ),
          space(width: 12),
          Expanded(
            child: Text(
              text,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[800],
              ),
            ),
          ),
        ],
      ),
    );
  }

  static Widget buildWhyJoinUs() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.primary.withOpacity(0.1),
            Colors.white,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Why Join Our Community?',
            style: B24.copyWith(color: AppColors.primary),
          ),
          space(height: 20),
          _buildFeatureRow(
            Icons.people,
            'Connect & Grow',
            'Join a network of like-minded individuals and expand your professional circle',
          ),
          space(height: 16),
          _buildFeatureRow(
            Icons.lightbulb,
            'Learn & Share',
            'Access valuable resources and share your knowledge with others',
          ),
          space(height: 16),
          _buildFeatureRow(
            Icons.rocket_launch,
            'Opportunities',
            'Discover new opportunities and stay ahead in your field',
          ),
        ],
      ),
    );
  }

  static Widget _buildFeatureRow(
      IconData icon, String title, String description) {
    return Container(
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              icon,
              color: AppColors.primary,
              size: 24,
            ),
          ),
          space(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: B18.copyWith(color: AppColors.primary),
                ),
                space(height: 4),
                Text(
                  description,
                  style: N14.copyWith(color: Colors.grey[600], height: 1.5),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
