import 'package:flutter/material.dart';
import 'package:shopping_app_new/Pages/product_list.dart';

import 'cart_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;
  final List<Widget> pages = [ProductList(), CartPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 0,
        unselectedFontSize: 0,
        iconSize: 30,
        currentIndex: currentIndex,
        onTap: (value) => setState(() => currentIndex = value),
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: ''),
        ],
      ),
      body: IndexedStack(index: currentIndex, children: pages),
    );
  }
}
