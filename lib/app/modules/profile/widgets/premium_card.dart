import 'package:community_app/shared/themes/colors.dart';
import 'package:community_app/shared/themes/text_styles.dart';
import 'package:community_app/shared/utils/space.dart';
import 'package:community_app/shared/widgets/btn.dart';
import 'package:flutter/material.dart';

class PremiumCard extends StatelessWidget {
  const PremiumCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF2C3E50),
            Color(0xFF3498DB),
          ],
        ),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Background Pattern
          Positioned(
            right: -20,
            top: -20,
            child: Icon(
              Icons.star,
              size: 150,
              color: Colors.white.withOpacity(0.1),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Premium',
                          style: B24.copyWith(
                            color: Colors.white,
                            letterSpacing: 1.2,
                          ),
                        ),
                        space(height: 4),
                        Text(
                          'Unlock All Features',
                          style: N16.copyWith(
                            color: Colors.white.withOpacity(0.8),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(
                        Icons.workspace_premium,
                        color: Colors.amber,
                        size: 32,
                      ),
                    ),
                  ],
                ),
                space(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildPremiumFeature('Unlimited Access'),
                      space(width: 16),
                      _buildPremiumFeature('Priority Support'),
                      space(width: 16),
                      _buildPremiumFeature('Exclusive Content'),
                    ],
                  ),
                ),
                space(height: 20),
                CustomButton(
                  label: "View Subscription Plans",
                  onPressed: () {
                    // Navigate to subscription plans
                  },
                  isOutlined: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumFeature(String feature) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.check_circle,
            color: Colors.green[300],
            size: 16,
          ),
          space(width: 4),
          Text(
            feature,
            style: N12.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
