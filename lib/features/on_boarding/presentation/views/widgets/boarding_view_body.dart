import 'package:flutter/material.dart';

class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: PageView.builder(
        itemBuilder: (context, index){
          return const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: AssetImage('assets/images/shopping.png')),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text('title',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Align(
                alignment: Alignment.bottomLeft,
                  child: Text('OnBoarding', style: TextStyle(fontSize: 20),))
            ],
          );
        },
        itemCount: 3,
      ),
    );
  }
}

