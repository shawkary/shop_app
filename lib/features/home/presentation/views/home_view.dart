import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/bottom_nav_bar.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/category_screen.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/favorites_screen.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/product_screen.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/settings_screen.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const ProductScreen(),
      const CategoryScreen(),
      const FavoriteScreen(),
      const SettingsScreen(),
    ];
    int currentIndex = 0;
    return Scaffold(
      appBar: customAppBar(context),
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
