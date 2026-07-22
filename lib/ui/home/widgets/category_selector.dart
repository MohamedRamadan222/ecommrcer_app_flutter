import 'package:flutter/material.dart';

import '../../../data/categories/models/categories_model.dart';
import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class CategorySelector extends StatelessWidget {
  final List<CategoriesModel> categories;
  final String? selectedCategory;
  final ValueChanged<String?> onCategorySelected;

  const CategorySelector({
    super.key,
    required this.categories,
    this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection:Axis.horizontal,
        itemCount: categories.length + 1,
        itemBuilder: (context, index) {
          final bool isAllItem = index == 0;
          final String? itemSlug = isAllItem
              ? null
              : categories[index - 1].slug;
          final itemName = isAllItem ? 'الكل' : categories[index - 1].name;
          final bool isSelected = selectedCategory == itemSlug;

          return Padding(
            padding: const EdgeInsetsDirectional.only(end: 8),
            child: InkWell(
              onTap: () {
                onCategorySelected(itemSlug);
              },
              child: Container(
                height: 33,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.black : AppColors.white,

                  borderRadius: BorderRadius.circular(32),
                  border: Border.all(color: AppColors.fieldBorder, width: 1),
                ),
                child: Text(
                  itemName,
                  style: AppStyles.bold13.copyWith(
                    color: isSelected
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
