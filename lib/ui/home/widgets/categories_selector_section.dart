import 'package:ecommerce_app/cubits/home/categories/categories_cubit.dart';
import 'package:ecommerce_app/cubits/home/categories/categories_state.dart';
import 'package:ecommerce_app/cubits/home/products/products_cubit.dart';
import 'package:ecommerce_app/cubits/home/products/products_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'category_selector.dart';

class CategoriesSelectorSection extends StatelessWidget {
  const CategoriesSelectorSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        switch (state.status) {
          case CategoriesStatus.initial:
          case CategoriesStatus.loading:
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Center(child: CupertinoActivityIndicator()),
            );
          case CategoriesStatus.error:
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Row(
                  children: [
                    Text(state.errMsg ?? 'حدث خطأ غير متوقع'),
                    const Gap(12),
                    ElevatedButton(
                      onPressed: () {
                        context.read<CategoriesCubit>().getCategories();
                      },
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              ),
            );
          case CategoriesStatus.success:
            return BlocBuilder<ProductsCubit, ProductsState>(
              builder: (context, productState){
                return CategorySelector(categories: state.category ?? [], selectedCategory: productState.selectedCategory,
                onCategorySelected: (slug) {
                  context.read<ProductsCubit>().selectCategory(slug);
                },
                );
              },
            );
        }
      },
    );
  }
}
