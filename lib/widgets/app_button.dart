import 'package:english_ap/values/app_colors.dart';
import 'package:english_ap/values/app_styles.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const AppButton({super.key, required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black12, offset: Offset(3, 6), blurRadius: 6)
        ],
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,

          splashColor: AppColors.primaryColor
              .withValues(alpha: 0.3), // Màu sóng khi nhấn
          highlightColor: AppColors.primaryColor
              .withValues(alpha: 0.1), // Màu highlight khi nhấn vào button
          borderRadius:
              BorderRadius.circular(8), // Bo tròn các góc của hiệu ứng sóng
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              label,
              style: AppStyles.h5.copyWith(color: Colors.black87),
            ),
          ),
        ),
      ),
    );
  }
}
