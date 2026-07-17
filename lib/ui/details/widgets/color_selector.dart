import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_styles.dart';

class ColorSelector extends StatefulWidget {
  final List<Color> colors;
  final int initialSelectedIndex;
  final ValueChanged<int>? onColorSelected;

  const ColorSelector({
    super.key,
    required this.colors,
    this.initialSelectedIndex = 0,
    this.onColorSelected,
  });

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
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
        Text('اللون', style: AppStyles.bold13),
        const Gap(10),
        SizedBox(
          width: double.infinity,
          height: 34,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            reverse: true,
            itemCount: widget.colors.length,
            itemBuilder: (context, index) {
              final isSelected = index == selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.onColorSelected?.call(index);
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 8),
                  width: 34,
                  height: 34,
                  decoration: BoxDecoration(
                    color: widget.colors[index],
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: isSelected ? AppColors.black : AppColors.fieldBorder,
                      width: isSelected ? 2 : 1.5,
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
