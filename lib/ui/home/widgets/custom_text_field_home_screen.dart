// ignore: file_names
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomTextFieldHomeScreen extends StatelessWidget {
  const CustomTextFieldHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 2),
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xffE2DCD3), width: 1),
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
child: TextFormField(
               style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
              ),
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'ابحثي عن فستان، عباية...',
                hintTextDirection: TextDirection.rtl,
                prefixIcon: Icon(
                  Icons.search_outlined,
                  color: Color(0xffA8A099),
                ),
                hintStyle: TextStyle(color: Color(0xffA8A099), fontSize: 14),
              ),
            ),
          ),
        ),
        Gap(10),
        Container(
          width: 20,
          height: 50,
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(Icons.tune_outlined, color: Colors.white),
        ),
      ],
    );
  }
}
