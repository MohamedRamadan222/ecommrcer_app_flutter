import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../account/account_screen.dart';
import '../cart/cart_screen.dart';
import '../categories/categories_screen.dart';
import '../favorite/favorite_screen.dart';
import 'home_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int currentIndex = 4;
  static const List<Widget> screens = [
    AccountScreen(),
    FavoriteScreen(),
    CartScreen(),
    CategoriesScreen(),
    HomeScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: currentIndex, children: screens),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,

        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        selectedItemColor: const Color(0xffB4835B),
        unselectedItemColor: const Color(0xffA8A099),
        backgroundColor: const Color(0xffEDE8E1),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 24,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        elevation: 8,
        selectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w400,
        ),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person),
            activeIcon: Icon(CupertinoIcons.person_fill),
            label: "حسابى",
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.heart),
            activeIcon: Icon(CupertinoIcons.heart_fill),
            label: "المفضلة",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: "السلة",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined),
            activeIcon: Icon(Icons.category),
            label: "التصنيفات",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: "الرئيسية",
          ),
        ],
      ),
    );
  }
}
