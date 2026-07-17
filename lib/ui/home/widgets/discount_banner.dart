import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';
import '../../constants/custom_elevated_button.dart';

class DiscountBanner extends StatelessWidget {
  const DiscountBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,
      decoration: BoxDecoration(
        color: AppColors.discountBannerBg,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -10,
            left: -10,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: AppColors.circleLight,
                borderRadius: BorderRadius.circular(80),
              ),
            ),
          ),
          Positioned(
            bottom: -40,
            left: 14,
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                color: AppColors.circleDark,
                borderRadius: BorderRadius.circular(80),
              ),
            ),
          ),
          Positioned(
            top: 16,
            right: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'تخفيضات الموسم',
                  style: AppStyles.bold13.copyWith(color: AppColors.primary),
                ),
                const Gap(4),
                Text(
                  'خصم حتى 30% على التشكيلة\nالصيفية',
                  textAlign: TextAlign.right,
                  style: AppStyles.bold13.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    height: 1.2,
                  ),
                ),
                const Gap(8),
                CustomElevatedButton(
                  width: 108,
                  height: 36,
                  radius: 999,
                  title: 'تسوّقي الآن',
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
