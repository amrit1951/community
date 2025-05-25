import 'package:community_app/shared/themes/colors.dart';
import 'package:community_app/shared/themes/text_styles.dart';
import 'package:flutter/material.dart';

class SkillChip extends StatelessWidget {
  final String label;

  const SkillChip({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
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
