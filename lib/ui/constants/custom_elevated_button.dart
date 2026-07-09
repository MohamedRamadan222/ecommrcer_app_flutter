import 'package:flutter/material.dart';

import 'app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final String title;

  const CustomElevatedButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: Text(
        title,
        style: AppStyles.bold13.copyWith(color: Colors.white, fontSize: 18),
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff1C1917),
        foregroundColor: Colors.white,
        minimumSize: const Size(double.infinity, 54),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),

        elevation: 3, // Subtle shadow
      ),
    );
  }
}
