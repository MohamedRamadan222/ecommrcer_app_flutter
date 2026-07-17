import 'package:flutter/material.dart';

import '../constants/app_colors.dart';

class SearchField extends StatelessWidget {
  final String hintText;

  const SearchField({
    super.key,
    this.hintText = 'ابحثي...',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.fieldBorder, width: 1),
        color: AppColors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextFormField(
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 2),
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintTextDirection: TextDirection.rtl,
          prefixIcon: const Icon(Icons.search_outlined, color: AppColors.textHint),
          hintStyle: const TextStyle(color: AppColors.textHint, fontSize: 14),
        ),
      ),
    );
  }
}
