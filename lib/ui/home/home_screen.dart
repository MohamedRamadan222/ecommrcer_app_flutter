import 'package:ecommerce_app/ui/home/widgets/category_selector.dart';
import 'package:ecommerce_app/ui/home/widgets/custom_app_bar.dart';
import 'package:ecommerce_app/ui/home/widgets/custom_textField_home_screen.dart';
import 'package:ecommerce_app/ui/home/widgets/discount_banner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      appBar: const CustomAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              Gap(16),
              CustomTextFieldHomeScreen(),
              Gap(16),
              DiscountBanner(),
              Gap(16),
              CategorySelector(),
              Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'عرض الكل',
                    style: AppStyles.bold13.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Color(0xffB4835B),
                    ),
                  ),
                  Text(
                    'وصل حديثًا',
                    style: AppStyles.bold13.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
              Gap(16),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  mainAxisExtent: 285,
                ),
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    width: 170,
                    height: 275,
                    decoration: BoxDecoration(
                      color: Color(0xffEFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              width: 148,
                              height: 168,
                              decoration: BoxDecoration(
                                color: Color(0xffE7DFD4),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: FaIcon(
                                  FontAwesomeIcons.shirt,
                                  color: Color(
                                    0xff1C1917,
                                  ).withValues(alpha: 0.2),
                                ),
                              ),
                            ),
                            Gap(8),
                            Text(
                              'فستان كتان مطرز',
                              style: AppStyles.bold13.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            Gap(8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  textDirection: TextDirection.rtl,
                                  '349 ر.س',
                                  style: AppStyles.bold13.copyWith(
                                    color: Color(0xffB4835B),
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '4.8',
                                      style: TextStyle(
                                        color: Color(0xff8D857C),
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Icon(
                                      Icons.star,
                                      size: 12,
                                      color: Color(0xffE8A33D),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Positioned(
                          top: 8,
                          left: 8,
                          child: Container(
                            width: 32,
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(80),
                            ),
                            child: Icon(CupertinoIcons.heart, size: 20),
                          ),
                        ),
                      ],
                    ),
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
