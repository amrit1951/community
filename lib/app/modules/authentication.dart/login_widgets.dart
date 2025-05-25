import 'package:community_app/shared/themes/colors.dart';
import 'package:community_app/shared/themes/text_styles.dart';
import 'package:community_app/shared/utils/space.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppGradients {
  static const linearBlueTealWhite = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [
      AppColors.primary, // Blue
      AppColors.secondary, // Teal
      AppColors.background, // Light background white
    ],
  );
}

Widget socialButton({
  required String icon,
  required String text,
  required VoidCallback onPressed,
}) {
  return SizedBox(
    width: double.infinity,
    height: 48,
    child: OutlinedButton.icon(
      icon: SizedBox(
          height: 25,
          width: 25,
          child: Image.asset(
            icon,
            fit: BoxFit.fill,
          )),
      label: Text(
        text,
        style: const TextStyle(color: Colors.black87),
      ),
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        backgroundColor: AppColors.background,
        side: const BorderSide(color: Color(0xFFE0E0E0)),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    ),
  );
}

Widget logoPart() {
  return SizedBox(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 120,
          width: 120,
          child: Image.asset(
            'assets/icons/c_logo.png',
            fit: BoxFit.fill,
          ),
        ),
        // space(height: 10),
        Text(
          "Business Community",
          style: B20.copyWith(color: AppColors.background),
        ),
        space(height: 10),
      ],
    ),
  );
}
