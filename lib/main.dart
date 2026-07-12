import 'package:ecommerce_app/ui/constants/app_colors.dart';
import 'package:ecommerce_app/ui/home/main_screen.dart';
import 'package:ecommerce_app/ui/login/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.bg,
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.bg,
        ),
        textTheme: GoogleFonts.almaraiTextTheme(),
      ),
      home: MainScreen(),
    );
  }
}
