import 'package:ecommerce_app/ui/constants/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({super.key});

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Spacer(),
              Text(
                'التصنيفات',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffE2DCD3), width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextFormField(
                obscureText: true,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'ابحثي في المتجر',
                  hintTextDirection: TextDirection.rtl,
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Color(0xffA8A099),
                  ),
                  hintStyle: TextStyle(color: Color(0xffA8A099), fontSize: 14),
                ),
              ),
            ),
            Gap(16),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Container(
                      width: double.infinity,
                      height: 76,
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xffEDE8E1), width: 1),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.arrow_back_ios,
                            size: 16,
                            color: Color(0xffA8A099),
                          ),
                          Spacer(),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'فساتين',
                                style: AppStyles.bold13.copyWith(fontSize: 15),
                              ),
                              Gap(2),
                              Text(
                                '124 منتجًا',
                                style: AppStyles.bold13.copyWith(
                                  fontSize: 12,
                                  color: Color(0xff8D857C),
                                ),
                              ),
                            ],
                          ),
                          Gap(14),
                          Container(
                            width: 52,
                            height: 52,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Color(0xffE7DFD4),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
