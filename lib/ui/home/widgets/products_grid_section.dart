import 'package:ecommerce_app/cubits/home/products/products_cubit.dart';
import 'package:ecommerce_app/cubits/home/products/products_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import 'custom_grid.dart';

class ProductsGridSection extends StatelessWidget {
  const ProductsGridSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsCubit, ProductsState>(
      builder: (context, state) {
        switch (state.status) {
          case ProductsStatus.initial:
          case ProductsStatus.loading:
            return const Padding(
              padding: EdgeInsets.symmetric(vertical: 40),
              child: Center(child: CupertinoActivityIndicator()),
            );

          case ProductsStatus.error:
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 40),
              child: Center(
                child: Column(
                  children: [
                    Text(state.errMsg ?? 'حدث خطأ غير متوقع'),
                    const Gap(12),
                    ElevatedButton(
                      onPressed: () {
                        context.read<ProductsCubit>().getProducts();
                      },
                      child: const Text('إعادة المحاولة'),
                    ),
                  ],
                ),
              ),
            );

          case ProductsStatus.success:
            return CustomGrid(products: state.filteredProducts);
        }
      },
    );
  }
}
