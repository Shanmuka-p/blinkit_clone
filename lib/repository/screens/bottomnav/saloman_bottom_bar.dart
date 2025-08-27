import 'package:blinkit_clone/repository/screens/cartscreen/cartscreen.dart';
import 'package:blinkit_clone/repository/screens/categories/categoryscreen.dart';
import 'package:blinkit_clone/repository/screens/home/homescreen.dart';
import 'package:blinkit_clone/repository/screens/print/print.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class SalomanBottomBar extends StatefulWidget {
  const SalomanBottomBar({super.key});

  @override
  State<SalomanBottomBar> createState() => _SalomanBottomBarState();
}

class _SalomanBottomBarState extends State<SalomanBottomBar> {
  int _currentIndex = 0;

  List<Widget> pages = [Homescreen(), Cartscreen(), Categoryscreen(), Print()];
  List<Color> colors = [
    Colors.red.shade100,
    Colors.green.shade100,
    Color(0XFFD9EBEB),
    Colors.blue.shade100,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[_currentIndex], // display selected page
      bottomNavigationBar: SalomonBottomBar(
        backgroundColor: colors[_currentIndex],
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: const Icon(Icons.home),
            title: const Text("Home"),
            selectedColor: Colors.redAccent,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text("Cart"),
            selectedColor: Colors.green,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: const Icon(Icons.category_outlined),
            title: const Text("Category"),
            selectedColor: Colors.teal,
          ),

          /// Settings
          SalomonBottomBarItem(
            icon: const Icon(Icons.print),
            title: const Text("Print"),
            selectedColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}
