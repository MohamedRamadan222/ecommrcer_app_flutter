import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_styles.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
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
                'حسابي',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.w800),
              ),
            ],
          ),
        ),
        scrolledUnderElevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Container(
                  width: double.infinity,
                  height: 92,
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Color(0xffEDE8E1), width: 1),
                  ),
                  child: Row(
                    children: [
                      Text(
                        'تعديل',
                        style: TextStyle(
                          color: Color(0xffB4835B),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Spacer(),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'سارة العتيبي',
                            style: AppStyles.bold13.copyWith(fontSize: 18),
                          ),
                          Gap(4),
                          Text(
                            '+966 55 123 4567',
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
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xffF1E9E1),
                        ),
                        child: Center(
                          child: Text(
                            'س',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              color: Color(0xffB4835B),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Gap(16),
              Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      border: Border.all(color: Color(0xffEDE8E1), width: 0.5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                          color: Color(0xffA8A099),
                        ),
                        Gap(14),
                        Container(
                          width: 56,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0xffF4EDE6),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Center(
                            child: Text(
                              textDirection: TextDirection.rtl,
                              ' 2 نشط',
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB4835B),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'طلباتي',
                          style: AppStyles.bold13.copyWith(fontSize: 15),
                        ),
                        Gap(14),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffF7F5F1),
                          ),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.cart,
                              color: Color(0xff6B645C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,

                      border: Border.all(color: Color(0xffEDE8E1), width: 0.5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                          color: Color(0xffA8A099),
                        ),
                        Spacer(),
                        Text(
                          'العناوين',
                          style: AppStyles.bold13.copyWith(fontSize: 15),
                        ),
                        Gap(14),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffF7F5F1),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.location_on_outlined,
                              color: Color(0xff6B645C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,

                      border: Border.all(color: Color(0xffEDE8E1), width: 0.5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                          color: Color(0xffA8A099),
                        ),
                        Spacer(),
                        Text(
                          'طرق الدفع',
                          style: AppStyles.bold13.copyWith(fontSize: 15),
                        ),
                        Gap(14),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffF7F5F1),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.wallet_outlined,
                              color: Color(0xff6B645C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      border: Border.all(color: Color(0xffEDE8E1), width: 0.5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                          color: Color(0xffA8A099),
                        ),
                        Gap(14),
                        Container(
                          width: 26,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0xffF4EDE6),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Center(
                            child: Text(
                              textDirection: TextDirection.rtl,
                              '3',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB4835B),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'كوبونات الخصم',
                          style: AppStyles.bold13.copyWith(fontSize: 15),
                        ),
                        Gap(14),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffF7F5F1),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.sell_outlined,
                              color: Color(0xff6B645C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(16),
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      border: Border.all(color: Color(0xffEDE8E1), width: 0.5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                          color: Color(0xffA8A099),
                        ),
                        Spacer(),
                        Text(
                          'الإعدادات',
                          style: AppStyles.bold13.copyWith(fontSize: 15),
                        ),
                        Gap(14),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffF7F5F1),
                          ),
                          child: Center(
                            child: Icon(
                              CupertinoIcons.settings,
                              color: Color(0xff6B645C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12),
                      ),
                      border: Border.all(color: Color(0xffEDE8E1), width: 0.5),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.arrow_back_ios,
                          size: 16,
                          color: Color(0xffA8A099),
                        ),
                        Gap(14),
                        Container(
                          width: 26,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Color(0xffF4EDE6),
                            borderRadius: BorderRadius.circular(999),
                          ),
                          child: Center(
                            child: Text(
                              textDirection: TextDirection.rtl,
                              '3',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Color(0xffB4835B),
                              ),
                            ),
                          ),
                        ),
                        Spacer(),
                        Text(
                          'المساعدة والدعم',
                          style: AppStyles.bold13.copyWith(fontSize: 15),
                        ),
                        Gap(14),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffF7F5F1),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.help_outline,
                              color: Color(0xff6B645C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Gap(16),
                  Container(
                    width: double.infinity,
                    height: 70,
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius:  BorderRadius.circular(12),
                      border: Border.all(color: Color(0xffEDE8E1), width: 0.5),
                    ),
                    child: Row(
                      children: [
                        Spacer(),
                        Text(
                          'تسجيل الخروج',
                          style: AppStyles.bold13.copyWith(fontSize: 16,color: Color(0xffC0533E)),
                        ),
                        Gap(14),
                        Container(
                          width: 52,
                          height: 52,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Color(0xffF7F5F1),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.logout,
                              color: Color(0xff6B645C),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
