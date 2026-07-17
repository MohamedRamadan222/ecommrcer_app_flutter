import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class QuantitySelector extends StatelessWidget {
  final int quantity;
  final double width;
  final double height;
  final VoidCallback? onIncrement;
  final VoidCallback? onDecrement;

  const QuantitySelector({
    super.key,
    this.quantity = 1,
    this.width = 62,
    this.height = 27,
    this.onIncrement,
    this.onDecrement,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: AppColors.bg,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1, color: AppColors.fieldBorder),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: onDecrement,
            child: const Icon(Icons.remove, size: 15, color: AppColors.textUnselected),
          ),
          Text('$quantity', style: AppStyles.bold13),
          GestureDetector(
            onTap: onIncrement,
            child: const Icon(Icons.add, size: 15, color: AppColors.textUnselected),
          ),
        ],
      ),
    );
  }
}
