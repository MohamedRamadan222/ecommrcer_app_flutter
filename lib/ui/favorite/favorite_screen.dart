import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';

import '../constants/app_styles.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
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
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff8D857C),
                ),
              ),
              Gap(10),
              Text(
                'المفضلة',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              Spacer(),
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
                  mainAxisExtent: 255,
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
                                Container(
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(10)
                                  ),
                                  child: Icon(Icons.add,color: Colors.white,size: 15,),
                                ),
                                Text(
                                  textDirection: TextDirection.rtl,
                                  '349 ر.س',
                                  style: AppStyles.bold13.copyWith(
                                    color: Color(0xffB4835B),
                                    fontSize: 14,
                                  ),
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
                            child: Icon(
                              CupertinoIcons.heart_fill,
                              size: 20,
                              color: Color(0xffB4835B),
                            ),
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
