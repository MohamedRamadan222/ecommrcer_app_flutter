import 'package:ecommerce_app/ui/home/widgets/category_selector.dart';
import 'package:ecommerce_app/ui/home/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/ui/home/widgets/custom_grid.dart';
import 'package:ecommerce_app/ui/home/widgets/custom_textField_home_screen.dart';
import 'package:ecommerce_app/ui/home/widgets/discount_banner.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Gap(16),
              CustomTextFieldHomeScreen(),
              Gap(16),
              DiscountBanner(),
              Gap(16),
              CategorySelector(),
              Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'عرض الكل',
                    style: AppStyles.bold13.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffB4835B),
                    ),
                  ),
                  Text(
                    'وصل حديثًا',
                    style: AppStyles.bold13.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Gap(16),
              CustomGrid()
            ],
          ),
        ),
      ),
    );
  }
}
