import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/custom_elevated_button.dart';
import '../../widgets/quantity_selector.dart';

class AddToCartBar extends StatefulWidget {
  final int initialQuantity;
  final VoidCallback? onAddToCart;

  const AddToCartBar({
    super.key,
    this.initialQuantity = 1,
    this.onAddToCart,
  });

  @override
  State<AddToCartBar> createState() => _AddToCartBarState();
}

class _AddToCartBarState extends State<AddToCartBar> {
  late int quantity;

  @override
  void initState() {
    super.initState();
    quantity = widget.initialQuantity;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      color: Colors.white,
      child: SafeArea(
        top: false,
        child: Row(
          children: [
            Expanded(
              child: CustomElevatedButton(
                title: 'أضيفي إلى السلة',
                height: 50,
                radius: 14,
                icon: const Icon(CupertinoIcons.shopping_cart, color: Colors.white, size: 18),
                onPressed: widget.onAddToCart,
              ),
            ),
            const Gap(12),
            QuantitySelector(
              quantity: quantity,
              width: 90,
              height: 40,
              onIncrement: () => setState(() => quantity++),
              onDecrement: () {
                if (quantity > 1) setState(() => quantity--);
              },
            ),
          ],
        ),
      ),
    );
  }
}
