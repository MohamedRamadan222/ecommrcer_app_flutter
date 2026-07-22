import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/storage/user_storage.dart';
import '../../constants/app_colors.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(95);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.bg,
      surfaceTintColor: Colors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      toolbarHeight: 95,
      titleSpacing: 16,
      centerTitle: false,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'hello  ${UserStorage.getUser()?.username ?? ''}',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: AppColors.textSecondary,
            ),
          ),
          const Gap(4),
          SvgPicture.asset('assets/svgs/2.svg'),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 20),
          child: Container(
            width: 50,
            height: 50,
            padding: const EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: AppColors.fieldBorder, width: 1.5),
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const Icon(CupertinoIcons.bell),
                Positioned(
                  top: 0,
                  right: 0,
                  child: SvgPicture.asset('assets/svgs/ellipse.svg'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
