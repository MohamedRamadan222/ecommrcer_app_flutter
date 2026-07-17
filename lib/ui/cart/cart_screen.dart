import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';
import '../constants/custom_elevated_button.dart';
import '../widgets/cart_item_tile.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '3 منتجات',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: AppColors.textSecondary,
                ),
              ),
              const Gap(10),
              const Text(
                'السلة',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const Spacer(),
            ],
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 3,
            itemBuilder: (context, index) {
              return CartItemTile(
                title: 'فستان كتان مطرز',
                variant: 'المقاس M · بيج',
                price: '289 ر.س',
                onIncrement: () {},
                onDecrement: () {},
              );
            },
          ),
          const Gap(14),
          _buildCouponRow(),
          const Gap(14),
          _buildOrderSummary(),
          const Gap(14),
          CustomElevatedButton(title: 'إتمام الشراء', onPressed: () {}),
        ],
      ),
    );
  }

  Widget _buildCouponRow() {
    return Row(
      children: [
        Container(
          width: 85,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.primaryLight,
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Center(
            child: Text(
              textDirection: TextDirection.rtl,
              'تطبيق',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ),
        ),
        const Gap(10),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.fieldBorder, width: 1),
              color: AppColors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: TextFormField(
              textAlign: TextAlign.right,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'كود الخصم',
                hintTextDirection: TextDirection.rtl,
                hintStyle: TextStyle(color: AppColors.textHint, fontSize: 14),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOrderSummary() {
    return Container(
      padding: const EdgeInsets.all(16),
      width: 350,
      height: 145,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.white,
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildSummaryRow('المجموع الفرعي', '747 ر.س'),
          _buildSummaryRow('الشحن', '25 ر.س'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '-75 ر.س',
                style: AppStyles.bold13.copyWith(color: AppColors.discountGreen),
                textDirection: TextDirection.rtl,
              ),
              const Text(
                'الخصم (SUMMER)',
                style: TextStyle(color: AppColors.textHint, fontSize: 14),
              ),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                textDirection: TextDirection.rtl,
                '697 ر.س',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
              Text(
                'الإجمالي',
                style: AppStyles.bold13.copyWith(fontSize: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          value,
          style: AppStyles.bold13,
          textDirection: TextDirection.rtl,
        ),
        Text(
          label,
          style: const TextStyle(color: AppColors.textHint, fontSize: 14),
        ),
      ],
    );
  }
}
