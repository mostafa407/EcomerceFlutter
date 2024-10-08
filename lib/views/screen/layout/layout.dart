import 'package:ecomerce/views/screen/layout/cart/cart_screen.dart';
import 'package:ecomerce/views/screen/layout/category/category_screen.dart';
import 'package:ecomerce/views/screen/layout/favourite/favourite.dart';
import 'package:ecomerce/views/screen/layout/home/homeScreen.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({super.key});

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  int currectIndex = 0;
  List<Widget> pages = [HomeScreen(),CategoryScreen(),FavouriteScreen(),CartScreen()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currectIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomNavigationBar(
            onTap: (value) {
              setState(() {
                currectIndex=value;
              });
            },
              currentIndex: currectIndex,
            selectedIconTheme: IconThemeData(color: Colors.red),
            unselectedIconTheme: IconThemeData(color: Colors.grey),
            items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,),label: "home"
          ),
          BottomNavigationBarItem(icon:
          Icon(Icons.shop_sharp),label: "Shop"),
          BottomNavigationBarItem(icon:
          Icon(Icons.favorite_outline), label: "favourite"),
          BottomNavigationBarItem(icon:
          Icon(Icons.shopify_sharp), label: "cart")
        ]),
      ),
    );
  }
}
