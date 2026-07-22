import 'package:ecommerce_app/data/home/models/product_model.dart';
import 'package:flutter/material.dart';

import '../../details/details_screen.dart';
import '../../widgets/product_card.dart';

class CustomGrid extends StatelessWidget {
  final List<ProductModel> products;

  const CustomGrid({super.key, required this.products});

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
      itemCount: products.length,
      itemBuilder: (context, index) {
        final ProductModel product = products[index];
        return InkWell(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DetailsScreen(product: product)));
          },
          child: ProductCard(
            title: product.title,
            price: '${product.price.toStringAsFixed(2)} ر.س',
            rating: product.rating.toString(),
            imageUrl: product.thumbnail,
            onFavoriteTap: () {},
          ),
        );
      },
    );
  }
}
