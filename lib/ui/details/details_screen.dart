import 'package:ecommerce_app/data/home/models/product_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';
import 'widgets/add_to_cart_bar.dart';
import 'widgets/details_action_button.dart';
import 'widgets/image_gallery_indicator.dart';

class DetailsScreen extends StatefulWidget {
  final ProductModel product;

  const DetailsScreen({super.key, required this.product});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final PageController _pageController = PageController();
  int _currentImageIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.placeholderBg,
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
          child: Column(
            children: [_buildProductImage(), _buildProductDetails()],
          ),
        ),
      ),
    );
  }

  Widget _buildProductImage() {
    final List<String> images = widget.product.images.isNotEmpty
        ? widget.product.images
        : [widget.product.thumbnail];

    return Container(
      width: double.infinity,
      height: 280,
      color: AppColors.placeholderBg,
      child: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: images.length,
            onPageChanged: (index) {
              setState(() {
                _currentImageIndex = index;
              });
            },
            itemBuilder: (context, index) {
              return Image.network(
                images[index],
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: FaIcon(
                      FontAwesomeIcons.shirt,
                      size: 60,
                      color: AppColors.black.withValues(alpha: 0.1),
                    ),
                  );
                },
                loadingBuilder: (context, child, progress) {
                  if (progress == null) return child;
                  return const Center(child: CircularProgressIndicator());
                },
              );
            },
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DetailsActionButton(
                  icon: const Icon(CupertinoIcons.heart, size: 18),
                  onTap: () {},
                ),

                DetailsActionButton(
                  icon: const Icon(CupertinoIcons.chevron_right, size: 18),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),

          Positioned(
            bottom: 16,
            left: 0,
            right: 0,
            child: ImageGalleryIndicator(
              count: images.length,
              selectedIndex: _currentImageIndex,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductDetails() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
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
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.product.price.toString(),
                textDirection: TextDirection.rtl,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),

              const SizedBox(height: 2),

              Text(
                widget.product.discountPercentage.toString(),
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

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                widget.product.title.toString(),
                textAlign: TextAlign.right,
                style: AppStyles.bold13.copyWith(fontSize: 17),
              ),

              const SizedBox(height: 4),

              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(width: 5),

                  Text(
                    widget.product.rating.toString(),
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                    ),
                  ),

                  const SizedBox(width: 3),

                  const Icon(Icons.star, size: 11, color: AppColors.star),
                ],
              ),
            ],
          ),
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
          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
        ),

        const Gap(8),

        Text(
          widget.product.description.toString(),
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
