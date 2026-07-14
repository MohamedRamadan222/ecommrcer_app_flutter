import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_styles.dart';
import '../constants/custom_elevated_button.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                '3 منتجات',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.normal,
                  color: Color(0xff8D857C),
                ),
              ),
              Gap(10),
              Text(
                'السلة',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
              Spacer(),
            ],
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: ListView(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 20, vertical: 14),
        children: [
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 15,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 14),
                child: Container(
                  width: double.infinity,
                  height: 112,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xffEDE8E1), width: 1),
                  ),
                  child: Row(
                    children: [
                      Container(
                        width: 62,
                        height: 27,
                        // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 6),
                        decoration: BoxDecoration(
                          color: Color(0xffF7F5F1),
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            width: 1,
                            color: Color(0xffE2DCD3),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.remove,
                                size: 15,
                                color: Color(0xff6B645C),
                              ),
                            ),
                            Text('1', style: AppStyles.bold13),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                Icons.add,
                                size: 15,
                                color: Color(0xff6B645C),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'فستان كتان مطرز',
                            style: AppStyles.bold13.copyWith(fontSize: 18),
                          ),
                          Gap(4),
                          Text(
                            'المقاس M · بيج',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Color(0xff8D857C),
                            ),
                          ),
                          Gap(14),
                          Text(
                            '289 ر.س',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(
                              color: Color(0xffB4835B),
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Gap(14),
                      Container(
                        width: 80,
                        height: 88,
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
          const Gap(14),
          Row(
            children: [
              Container(
                width: 85,
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xffF4EDE6),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                  child: Text(
                    textDirection: TextDirection.rtl,
                    'تطبيق',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffB4835B),
                    ),
                  ),
                ),
              ),
              Gap(10),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xffE2DCD3), width: 1),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'كود الخصم',
                      hintTextDirection: TextDirection.rtl,
                      hintStyle: TextStyle(
                        color: Color(0xffA8A099),
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(14),
          Container(
            padding: EdgeInsets.all(16),
            width: 350,
            height: 145,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.white,
              border: Border.all(color: Color(0xffEDE8E1), width: 1),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '747 ر.س',
                      style: AppStyles.bold13,
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      'المجموع الفرعي',
                      style: TextStyle(color: Color(0xffA8A099), fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '25 ر.س',
                      style: AppStyles.bold13,
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      'الشحن',
                      style: TextStyle(color: Color(0xffA8A099), fontSize: 14),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '-75 ر.س',
                      style: AppStyles.bold13.copyWith(
                        color: Color(0xff3E8E5A),
                      ),
                      textDirection: TextDirection.rtl,
                    ),
                    Text(
                      'الخصم (SUMMER)',
                      style: TextStyle(color: Color(0xffA8A099), fontSize: 14),
                    ),
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      textDirection: TextDirection.rtl,
                      '697 ر.س',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffB4835B),
                      ),
                    ),
                    Text(
                      'الإجمالي',
                      style: AppStyles.bold13.copyWith(fontSize: 18),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Gap(14),
          CustomElevatedButton(title: 'إتمام الشراء'),
        ],
      ),
    );
  }
}
