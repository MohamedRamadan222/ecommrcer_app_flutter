import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final String rating;
  final bool isFavorite;
  final VoidCallback? onFavoriteTap;
  final VoidCallback? onAddToCartTap;

  const ProductCard({
    super.key,
    required this.title,
    required this.price,
    this.rating = '4.8',
    this.isFavorite = false,
    this.onFavoriteTap,
    this.onAddToCartTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 150,
                decoration: BoxDecoration(
                  color: AppColors.placeholderBg,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: FaIcon(
                    FontAwesomeIcons.shirt,
                    color: AppColors.black.withValues(alpha: 0.2),
                  ),
                ),
              ),
              const Gap(6),
              Text(
                title,
                style: AppStyles.bold13.copyWith(
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const Gap(6),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (onAddToCartTap != null)
                    GestureDetector(
                      onTap: onAddToCartTap,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(Icons.add, color: Colors.white, size: 15),
                      ),
                    ),
                  Text(
                    textDirection: TextDirection.rtl,
                    price,
                    style: AppStyles.bold13.copyWith(
                      color: AppColors.primary,
                      fontSize: 13,
                    ),
                  ),
                  if (onAddToCartTap == null)
                    Row(
                      children: [
                        Text(
                          rating,
                          style: TextStyle(
                            color: AppColors.textSecondary,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Icon(Icons.star, size: 11, color: AppColors.star),
                      ],
                    ),
                ],
              ),
            ],
          ),
          Positioned(
            top: 6,
            left: 6,
            child: GestureDetector(
              onTap: onFavoriteTap,
              child: Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: Icon(
                  isFavorite ? CupertinoIcons.heart_fill : CupertinoIcons.heart,
                  size: 18,
                  color: isFavorite ? AppColors.primary : null,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
