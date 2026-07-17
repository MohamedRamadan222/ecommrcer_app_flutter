import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';
import 'widgets/add_to_cart_bar.dart';
import 'widgets/color_selector.dart';
import 'widgets/description_section.dart';
import 'widgets/details_action_button.dart';
import 'widgets/image_gallery_indicator.dart';
import 'widgets/size_selector.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.placeholderBg,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildProductImage(),

              _buildProductDetails(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    return Container(
      width: double.infinity,
      height: 280,
      color: AppColors.placeholderBg,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DetailsActionButton(
                icon: const Icon(
                  CupertinoIcons.heart,
                  size: 18,
                ),
                onTap: () {},
              ),

              DetailsActionButton(
                icon: const Icon(
                  CupertinoIcons.chevron_right,
                  size: 18,
                ),
                onTap: () {},
              ),
            ],
          ),

          const Spacer(),

          FaIcon(
            FontAwesomeIcons.shirt,
            size: 60,
            color: AppColors.black.withValues(
              alpha: 0.1,
            ),
          ),

          const Spacer(),

          const ImageGalleryIndicator(
            count: 3,
            selectedIndex: 0,
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(
        16,
        16,
        16,
        24,
      ),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildProductHeader(),

          const Gap(20),

          _buildColorSection(),

          const Gap(20),

          _buildSizeSection(),

          const Gap(20),

          _buildDescription(),

          const Gap(24),

          const AddToCartBar(),
        ],
      ),
    );
  }

  Widget _buildProductHeader() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // السعر
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                '289 ر.س',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 2),

              const Text(
                '349 ر.س',
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 10,
                  decoration: TextDecoration.lineThrough,
                  color: AppColors.textHint,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(width: 12),

        // اسم المنتج والتقييم
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'فستان كتان مطرز',
                textAlign: TextAlign.right,
                style: AppStyles.bold13.copyWith(
                  fontSize: 17,
                ),
              ),

              const SizedBox(height: 4),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Text(
                    '124 تقييمًا',
                    textDirection: TextDirection.rtl,
                    style: TextStyle(
                      fontSize: 10,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const SizedBox(width: 5),

                  const Text(
                    '4.8',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const SizedBox(width: 3),

                  const Icon(
                    Icons.star,
                    size: 11,
                    color: AppColors.star,
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'اللون',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Gap(8),

        ColorSelector(
          colors: const [
            AppColors.white,
            Color(0xffC8A88C),
            Color(0xff5A5A5A),
            Color(0xff8E9B8C),
          ],
          initialSelectedIndex: 0,
        ),
      ],
    );
  }

  Widget _buildSizeSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'المقاس',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Gap(8),

        const SizeSelector(
          sizes: [
            'S',
            'M',
            'L',
            'XL',
          ],
          initialSelectedIndex: 1,
        ),
      ],
    );
  }

  Widget _buildDescription() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Text(
          'الوصف',
          textDirection: TextDirection.rtl,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),

        const Gap(8),

        const Text(
          'فستان صيفي من الكتان الطبيعي 100% بتطريز يدوي على الصدر. '
              'قصة واسعة مريحة وأكمام واسعة مناسبة للمناسبات النهارية.',
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.right,
          style: TextStyle(
            fontSize: 11,
            height: 1.7,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}