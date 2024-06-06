import 'package:flutter/material.dart';
import 'boarding_model.dart';


class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: PageView.builder(
        itemBuilder: (context, index){
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Image(image: AssetImage('assets/images/shopping.png')),
              const SizedBox(height: 20),
              Align(alignment: Alignment.bottomLeft,
                child: Text(lst[index].title,
                  style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              ),
              Align(alignment: Alignment.bottomLeft,
                  child: Text(lst[index].onBoarding, style: const TextStyle(fontSize: 20),))
            ],
          );
        },
        itemCount: 3,
      ),
    );
  }
}

