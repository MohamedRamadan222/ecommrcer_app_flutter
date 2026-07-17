import 'package:ecommerce_app/ui/constants/custom_elevated_button.dart';
import 'package:ecommerce_app/ui/login/widgets/login_form.dart';
import 'package:ecommerce_app/ui/login/widgets/logo_section.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              LogoSection(),
              Gap(20),
              LoginForm(),
              Gap(20),
              CustomElevatedButton(title: 'تسجيل الدخول', onPressed: () {}),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'إنشاء حساب',
                    style: AppStyles.bold13.copyWith(
                      color: AppColors.primary,
                      fontSize: 16,
                    ),
                  ),
                  Gap(2),
                  Text(
                    'ليس لديك حساب؟',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
              Gap(16),
            ],
          ),
        ),
      ),
    );
  }
}
