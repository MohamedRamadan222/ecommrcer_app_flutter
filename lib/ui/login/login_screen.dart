import 'package:ecommerce_app/ui/constants/custom_elevated_button.dart';
import 'package:ecommerce_app/ui/login/widgets/login_form.dart';
import 'package:ecommerce_app/ui/login/widgets/logo_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            LogoSection(),
            Gap(20),
            LoginForm(),
            Gap(20),
            CustomElevatedButton(title: 'تسجيل الدخول'),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'إنشاء حساب',
                  style: AppStyles.bold13.copyWith(
                    color: Color(0xffB4835B),
                    fontSize: 16,
                  ),
                ),
                Gap(2),
                Text(
                  'ليس لديك حساب؟',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xff8D857C),
                  ),
                ),
              ],
            ),
            Gap(14),
          ],
        ),
      ),
    );
  }
}
