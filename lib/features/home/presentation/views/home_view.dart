import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Home', style: Styles.textStyle30,),
      ),
    );
  }
}
