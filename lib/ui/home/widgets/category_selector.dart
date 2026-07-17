import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({super.key});

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Padding(
              padding: const EdgeInsetsDirectional.only(end: 8),
              child: Container(
                width: 73,
                height: 33,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: selectedIndex == index ? AppColors.black : AppColors.white,
                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: AppColors.fieldBorder, width: 1),
                ),
                child: Text(
                  'عبايات',
                  style: AppStyles.bold13.copyWith(
                    color: selectedIndex == index
                        ? AppColors.white
                        : AppColors.textUnselected,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
