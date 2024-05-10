import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:brainiaccommerce2/screens/cart_screen.dart';
import 'package:brainiaccommerce2/screens/favourite/favourite_screen.dart';
import 'package:brainiaccommerce2/screens/home_screen.dart';
import 'package:brainiaccommerce2/screens/acount/profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int pageIndex = 0;

  List<Widget> pages = [
    HomeScreen(),
    CartScreen(),
    FavouriteScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(
        index: pageIndex,
        children: pages,
      ),
      
      bottomNavigationBar: AnimatedBottomNavigationBar(
        
        icons: [
          CupertinoIcons.home,
          CupertinoIcons.cart,
          CupertinoIcons.heart,
          CupertinoIcons.profile_circled,
        ],
        //splash color
        inactiveColor: Colors.black.withOpacity(0.5),
        activeColor: Color(0xFFDB3022),
        gapLocation: GapLocation.none,
        activeIndex: pageIndex,
        // notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 10,
        iconSize: 25,
        rightCornerRadius: 10,
        elevation: 0,
        onTap: (index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}
