import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'boarding_model.dart';


class OnBoardingViewBody extends StatelessWidget {
  const OnBoardingViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    PageController controller = PageController();
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: (index) {},
              controller: controller,
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
              itemCount: lst.length,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SmoothPageIndicator(
                  controller: controller,
                  count: lst.length,
                effect: const ExpandingDotsEffect(
                  activeDotColor: Colors.blue,
                ),
              ),
              FloatingActionButton(
                backgroundColor: Colors.blue,
                  onPressed: (){},
                  child: const Icon(Icons.arrow_forward_ios, color: Colors.white,),
              )
            ],
          )
        ],
      ),
    );
  }
}

