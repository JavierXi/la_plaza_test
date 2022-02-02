import 'package:flutter/material.dart';
import 'package:la_plaza/categories/categories.dart';
import 'package:la_plaza/profile/profile.dart';
import 'package:la_plaza/shopping/shopping.dart';
import 'package:la_plaza/utils/colors.dart' as color;
import 'package:la_plaza/homepage/ui/screens/homepage.dart';

class NavigationBar extends StatefulWidget {
  final int indexPage;
  const NavigationBar({Key? key, required this.indexPage}) : super(key: key);

  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int currentIndex = 0;

  @override
  void initState() {
    currentIndex = widget.indexPage;
    super.initState();
  }

  final body = [
    const HomePage(),
    const Categories(),
    const Shopping(),
    const Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.backgroundColor,
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: color.AppColor.backgroundColor,
        elevation: 5.0,
        iconSize: 25,
        selectedItemColor: color.AppColor.lightGreenColor,
        selectedFontSize: 14,
        selectedLabelStyle: TextStyle(color: color.AppColor.lightGreenColor),
        unselectedItemColor: color.AppColor.darkGrayColor.withOpacity(0.4),
        unselectedFontSize: 14,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        items: [
          BottomNavigationBarItem(
            backgroundColor: color.AppColor.lightGreenColor,
            icon: const Icon(Icons.house_rounded),
            activeIcon: const Icon(
              Icons.house_rounded,
              size: 25,
            ),
            tooltip: 'Inicio',
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            backgroundColor: color.AppColor.lightGreenColor,
            icon: const Icon(Icons.grid_view_outlined),
            activeIcon: const Icon(
              Icons.grid_view_outlined,
              size: 25,
            ),
            tooltip: 'Categorías',
            label: 'Categorías',
          ),
          BottomNavigationBarItem(
            backgroundColor: color.AppColor.lightGreenColor,
            icon: const Icon(Icons.shopping_basket_outlined),
            activeIcon: const Icon(
              Icons.shopping_basket_outlined,
              size: 25,
            ),
            tooltip: 'Compras',
            label: 'Compras',
          ),
          BottomNavigationBarItem(
            backgroundColor: color.AppColor.lightGreenColor,
            icon: const Icon(Icons.account_circle_rounded),
            activeIcon: const Icon(
              Icons.account_circle_rounded,
              size: 25,
            ),
            tooltip: 'Perfil',
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
