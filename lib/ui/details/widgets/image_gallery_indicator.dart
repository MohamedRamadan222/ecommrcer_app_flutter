import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';

class ImageGalleryIndicator extends StatelessWidget {
  final int count;
  final int selectedIndex;

  const ImageGalleryIndicator({
    super.key,
    required this.count,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final isSelected = index == selectedIndex;
        return AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(horizontal: 3),
          width: isSelected ? 18 : 6,
          height: 6,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.black : AppColors.textHint,
            borderRadius: BorderRadius.circular(3),
          ),
        );
      }),
    );
  }
}
