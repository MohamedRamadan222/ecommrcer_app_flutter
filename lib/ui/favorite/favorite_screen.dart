import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../widgets/product_card.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                '6 منتجات',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff8D857C),
                ),
              ),
              const Gap(10),
              const Text(
                'المفضلة',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              const Spacer(),
            ],
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 16.0),
          child: Column(
            children: [
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 270,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ProductCard(
                    title: 'فستان كتان مطرز',
                    price: '349 ر.س',
                    isFavorite: true,
                    onFavoriteTap: () {},
                    onAddToCartTap: () {},
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
