import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class SizeSelector extends StatefulWidget {
  final List<String> sizes;
  final int initialSelectedIndex;
  final ValueChanged<int>? onSizeSelected;

  const SizeSelector({
    super.key,
    required this.sizes,
    this.initialSelectedIndex = 1,
    this.onSizeSelected,
  });

  @override
  State<SizeSelector> createState() => _SizeSelectorState();
}

class _SizeSelectorState extends State<SizeSelector> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.initialSelectedIndex;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('المقاس', style: AppStyles.bold13),
        const Gap(10),
        SizedBox(
          width: double.infinity,
          height: 42,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemCount: widget.sizes.length,
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.onSizeSelected?.call(index);
                },
                child: Container(
                  width: 42,
                  height: 42,
                  margin: const EdgeInsets.only(left: 8),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.black : AppColors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: isSelected ? AppColors.black : AppColors.fieldBorder,
                      width: 1,
                    ),
                  ),
                  child: Text(
                    widget.sizes[index],
                    style: AppStyles.bold13.copyWith(
                      fontSize: 14,
                      color: isSelected ? AppColors.white : AppColors.black,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
