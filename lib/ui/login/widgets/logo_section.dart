import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../constants/app_colors.dart';

class LogoSection extends StatelessWidget {
  const LogoSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gap(144),
        Center(child: SvgPicture.asset('assets/svgs/kha.svg')),
        Gap(10),
        Center(child: SvgPicture.asset('assets/svgs/2.svg')),
        Gap(10),
        const Text(
          'أزياء تليق بكِ، كل يوم',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.textSecondary,
          ),
        ),
        Gap(20),
      ],
    );
  }
}
