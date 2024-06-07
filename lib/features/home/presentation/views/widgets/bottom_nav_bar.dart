import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      onTap: (index)
      {

      },
      backgroundColor: Colors.grey.shade100,
      selectedItemColor: Colors.lightBlue,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(label: 'Product', icon: Icon(Icons.home)),
        BottomNavigationBarItem(label: 'Category', icon: Icon(Icons.category)),
        BottomNavigationBarItem(label: 'Favorites', icon: Icon(Icons.favorite)),
        BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
      ],);
  }
}