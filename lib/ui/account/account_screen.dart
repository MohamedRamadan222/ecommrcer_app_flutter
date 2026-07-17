import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';
import '../widgets/account_menu_item.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Spacer(),
              const Text(
                'حسابي',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              _buildProfileCard(),
              const Gap(16),
              _buildMenuSection(),
              const Gap(16),
              _buildLogoutItem(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileCard() {
    return Container(
      width: double.infinity,
      height: 92,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.cardBorder, width: 1),
      ),
      child: Row(
        children: [
          const Text(
            'تعديل',
            style: TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('سارة العتيبي', style: AppStyles.bold13.copyWith(fontSize: 18)),
              const Gap(4),
              Text(
                '+966 55 123 4567',
                style: AppStyles.bold13.copyWith(
                  fontSize: 12,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const Gap(14),
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: AppColors.primaryBg,
            ),
            child: const Center(
              child: Text(
                'س',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w800,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuSection() {
    return Column(
      children: [
        AccountMenuItem(
          title: 'طلباتي',
          icon: const Icon(CupertinoIcons.cart, color: AppColors.textUnselected),
          badge: ' 2 نشط',
        ),
        AccountMenuItem(
          title: 'العناوين',
          icon: const Icon(Icons.location_on_outlined, color: AppColors.textUnselected),
          badge: null,
        ),
        AccountMenuItem(
          title: 'طرق الدفع',
          icon: const Icon(Icons.wallet_outlined, color: AppColors.textUnselected),
          badge: null,
        ),
        AccountMenuItem(
          title: 'كوبونات الخصم',
          icon: const Icon(Icons.sell_outlined, color: AppColors.textUnselected),
          badge: '3',
        ),
        const Gap(16),
        AccountMenuItem(
          title: 'الإعدادات',
          icon: const Icon(CupertinoIcons.settings, color: AppColors.textUnselected),
          badge: null,
        ),
        AccountMenuItem(
          title: 'المساعدة والدعم',
          icon: const Icon(Icons.help_outline, color: AppColors.textUnselected),
          badge: '3',
        ),
      ],
    );
  }

  Widget _buildLogoutItem() {
    return AccountMenuItem(
      title: 'تسجيل الخروج',
      icon: const Icon(Icons.logout, color: AppColors.textUnselected),
      badge: null,
      titleColor: AppColors.logoutRed,
      onTap: () {},
    );
  }
}
