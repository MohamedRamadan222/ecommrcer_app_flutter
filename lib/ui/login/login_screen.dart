import 'package:ecommerce_app/cubits/auth/auth_cubit.dart';
import 'package:ecommerce_app/cubits/auth/auth_state.dart';
import 'package:ecommerce_app/ui/constants/custom_elevated_button.dart';
import 'package:ecommerce_app/ui/home/main_screen.dart';
import 'package:ecommerce_app/ui/login/widgets/login_form.dart';
import 'package:ecommerce_app/ui/login/widgets/logo_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../constants/app_colors.dart';
import '../constants/app_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state.status == AuthStatus.error) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.errMsg ?? 'حدث خطأ ما')),
                );
              }
              if (state.status == AuthStatus.success) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MainScreen()),
                );
              }
            },
            builder: (context, state) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(top: 40,bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const LogoSection(),
                      const Gap(20),
                      LoginForm(usernameController: _usernameController, passwordController: _passwordController,),
                      Gap(20),
                      CustomElevatedButton(title: 'تسجيل الدخول', onPressed: state.status == AuthStatus.loading ? null :(){
                        context.read<AuthCubit>().login(username: _usernameController.text, password: _passwordController.text);
                      }),
                      const Gap(40),
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
                      if (state.status == AuthStatus.loading)
                        const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: CircularProgressIndicator(),
                        ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
