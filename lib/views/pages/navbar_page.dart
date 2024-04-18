import 'package:ar_market/views/pages/cart_page.dart';
import 'package:ar_market/views/pages/home_page.dart';
import 'package:ar_market/views/pages/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class ButtonNavBar extends StatefulWidget {
  const ButtonNavBar({super.key});

  @override
  State<ButtonNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<ButtonNavBar> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    Text(
      'Shop',
      style: optionStyle,
    ),
    CartPage(),
    ProfilePage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              color: Colors.deepPurple,
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
            child: GNav(
              activeColor: Colors.green,
              duration: const Duration(milliseconds: 400),
              color: Colors.deepPurple,
              tabBackgroundColor: Colors.black,
              padding: const EdgeInsets.all(8),
              gap: 8,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                ),
                GButton(
                  icon: Icons.shopping_bag,
                  text: "shop",
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: "Cart",
                ),
                GButton(
                  icon: Icons.person,
                  text: "Profile",
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
