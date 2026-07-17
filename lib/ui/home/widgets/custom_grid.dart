import 'package:flutter/material.dart';

import '../../widgets/product_card.dart';

class CustomGrid extends StatelessWidget {
  const CustomGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        mainAxisExtent: 245,
      ),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ProductCard(
          title: 'فستان كتان مطرز',
          price: '349 ر.س',
          rating: '4.8',
          onFavoriteTap: () {},
        );
      },
    );
  }
}
