import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class AccountMenuItem extends StatelessWidget {
  final String title;
  final Widget icon;
  final String? badge;
  final bool showArrow;
  final Color? titleColor;
  final VoidCallback? onTap;

  const AccountMenuItem({
    super.key,
    required this.title,
    required this.icon,
    this.badge,
    this.showArrow = true,
    this.titleColor,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 70,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.cardBorder, width: 0.5),
        ),
        child: Row(
          children: [
            if (showArrow)
              const Icon(Icons.arrow_back_ios, size: 16, color: AppColors.textHint),
            if (showArrow) const Gap(14),
            if (badge != null)
              Container(
                width: 26,
                height: 20,
                decoration: BoxDecoration(
                  color: AppColors.primaryLight,
                  borderRadius: BorderRadius.circular(999),
                ),
                child: Center(
                  child: Text(
                    textDirection: TextDirection.rtl,
                    badge!,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            const Spacer(),
            Text(
              title,
              style: AppStyles.bold13.copyWith(
                fontSize: 15,
                color: titleColor ?? AppColors.black,
              ),
            ),
            const Gap(14),
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppColors.bg,
              ),
              child: Center(child: icon),
            ),
          ],
        ),
      ),
    );
  }
}
