import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(95);

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
            'مرحبًا سارة',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              color: Color(0xff8D857C),
            ),
          ),
          Gap(4),
          SvgPicture.asset('assets/svgs/2.svg'),
        ],
      ),
      actions: [
        Padding(
          padding: const EdgeInsetsDirectional.only(end: 20),
          child: Container(
            width: 50,
            height: 50,
            padding: EdgeInsets.all(9),
            decoration: BoxDecoration(
              color: Color(0xffFFFFFF),
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: Color(0xffE2DCD3), width: 1.5),
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
