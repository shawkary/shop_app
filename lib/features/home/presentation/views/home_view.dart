import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/category_screen.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/favorites_screen.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/product_screen.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/settings_screen.dart';



class HomeView extends StatefulWidget {
  const HomeView({super.key});


  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
    int currentIndex = 0;
    List<Widget> screens = [
      const ProductScreen(),
      const CategoryScreen(),
      const FavoriteScreen(),
      const SettingsScreen(),
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index)
        {
          setState(() {
            currentIndex = index;
          });
        },
        currentIndex: currentIndex,
        backgroundColor: Colors.grey.shade100,
        selectedItemColor: Colors.lightBlue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(label: 'Product', icon: Icon(Icons.home)),
          BottomNavigationBarItem(label: 'Category', icon: Icon(Icons.category)),
          BottomNavigationBarItem(label: 'Favorites', icon: Icon(Icons.favorite)),
          BottomNavigationBarItem(label: 'Settings', icon: Icon(Icons.settings)),
        ],),
    );
  }
}
