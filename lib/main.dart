import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/on_boarding/presentation/views/boarding_view.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoardingView(),
    );
  }
}
