import 'package:ecommerce_app/cubits/home/categories/categories_cubit.dart';
import 'package:ecommerce_app/cubits/home/categories/categories_state.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../data/categories/models/categories_model.dart';
import '../constants/app_colors.dart';
import '../widgets/category_tile.dart';
import '../widgets/search_field.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              const Spacer(),
              const Text(
                'التصنيفات',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.bg,
        surfaceTintColor: Colors.transparent,
      ),
      body: BlocBuilder<CategoriesCubit, CategoriesState>(
       builder: (context, state){
         switch (state.status){
           case CategoriesStatus.initial:
           case CategoriesStatus.loading:
           return const Padding(
             padding: EdgeInsets.symmetric(vertical: 40),
             child: Center(child: CupertinoActivityIndicator()),
           );

           case CategoriesStatus.error:
             return Padding(
               padding: const EdgeInsets.symmetric(vertical: 40),
               child: Center(
                 child: Column(
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
             return Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            const SearchField(hintText: 'ابحثي في المتجر'),
            const Gap(16),
            Expanded(
              child: ListView.builder(
                itemCount: state.category!.length,
                itemBuilder: (context, index) {
                  final CategoriesModel category = state.category![index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: CategoryTile(
                      title: category.slug,
                      productCount: category.name,
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
             );
         }
       },
      )
    );
  }
}
//Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//         child: Column(
//           children: [
//             const SearchField(hintText: 'ابحثي في المتجر'),
//             const Gap(16),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding: const EdgeInsets.only(bottom: 10),
//                     child: CategoryTile(
//                       title: 'فساتين',
//                       productCount: '124 منتجًا',
//                       onTap: () {},
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),