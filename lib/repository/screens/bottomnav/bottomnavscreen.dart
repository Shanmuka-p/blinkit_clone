import 'package:blinkit_clone/repository/screens/cartscreen/cartscreen.dart';
import 'package:blinkit_clone/repository/screens/categories/categoryscreen.dart';
import 'package:blinkit_clone/repository/screens/home/homescreen.dart';
import 'package:blinkit_clone/repository/screens/profile/profilescreen.dart';
import 'package:flutter/material.dart';

class Bottomnavscreen extends StatefulWidget {
  const Bottomnavscreen({super.key});

  @override
  State<Bottomnavscreen> createState() => _BottomnavscreenState();
}

class _BottomnavscreenState extends State<Bottomnavscreen> {
  int curr_index = 0;
  List<Widget> pages = [
    Homescreen(),
    Cartscreen(),
    Categoryscreen(),
    Profilescreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(index: curr_index, children: pages),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: curr_index,
        //currentIndex: _selectedIndex,
        selectedItemColor: Colors.amberAccent,
        //onTap: curr_index,
        onTap: (index) {
          setState(() {
            curr_index = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, size: 30),

            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart, size: 30),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category_outlined, size: 30),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_rounded, size: 30),
            label: "Profile",
          ),
        ],
      ),
    );
  }
}
