import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class CategoryTile extends StatelessWidget {
  final String title;
  final String productCount;
  final VoidCallback? onTap;

  const CategoryTile({
    super.key,
    required this.title,
    required this.productCount,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 76,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.cardBorder, width: 1),
        ),
        child: Row(
          children: [
            const Icon(Icons.arrow_back_ios, size: 16, color: AppColors.textHint),
            const Spacer(),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(title, style: AppStyles.bold13.copyWith(fontSize: 15)),
                const Gap(2),
                Text(
                  productCount,
                  style: AppStyles.bold13.copyWith(fontSize: 12, color: AppColors.textSecondary),
                ),
              ],
            ),
            const Gap(14),
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.placeholderBg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
