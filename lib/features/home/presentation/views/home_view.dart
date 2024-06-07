import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/custom_app_bar.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      // BusinessScreen(),
      // ScienceScreen(),
      // SportsScreen(),
    ];
    return Scaffold(
      appBar: customAppBar(context),
      body: ,
    );
  }
}
