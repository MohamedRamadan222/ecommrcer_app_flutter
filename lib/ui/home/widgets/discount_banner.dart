import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/app_styles.dart';
import '../../constants/custom_elevated_button.dart';

class DiscountBanner extends StatefulWidget {
  const DiscountBanner({super.key});

  @override
  State<DiscountBanner> createState() => _DiscountBannerState();
}

class _DiscountBannerState extends State<DiscountBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 170,

      decoration: BoxDecoration(
        color: Color(0xffF4EDE6),
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
                color: Color(0xffECDED4),
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
                color: Color(0xffF0E6DE),
                borderRadius: BorderRadius.circular(80),
              ),
            ),
          ),
          Positioned(
            top: 22,
            right: 22,
            bottom: 22,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
                Text(
                  'تخفيضات الموسم',
                  style: AppStyles.bold13.copyWith(color: Color(0xffB4835B)),
                ),
                Text(
                  'خصم حتى 30% على التشكيلة\nالصيفية',
                  textAlign: TextAlign.right,
                  style: AppStyles.bold13.copyWith(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
                Gap(8),
                CustomElevatedButton(
                  width: 108,
                  height: 40,
                  radius: 999,
                  title: 'تسوّقي الآن',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
