import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../constants/app_styles.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('البريد الإلكتروني', style: AppStyles.bold13),
        Gap(8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          decoration: BoxDecoration(
            border: Border.all(color: Color(0xffE2DCD3), width: 1),
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
          ),
          child: TextFormField(
            textAlign: TextAlign.right,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'sara@example.com',
              hintTextDirection: TextDirection.rtl,
              hintStyle: TextStyle(color: Color(0xffA8A099), fontSize: 14),
            ),
          ),
        ),
        Gap(20),
        Text('كلمة المرور', style: AppStyles.bold13),
        Gap(8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 6),
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
              letterSpacing: 3,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: 'كلمة المرور',

              suffixIcon: Icon(
                Icons.remove_red_eye_outlined,
                color: Color(0xffA8A099),
              ),
              hintStyle: TextStyle(color: Color(0xffA8A099), fontSize: 14),
            ),
          ),
        ),
        Gap(8),
        Text(
          'نسيت كلمة المرور؟',
          style: AppStyles.bold13.copyWith(color: Color(0xffB4835B)),
        ),
      ],
    );
  }
}
