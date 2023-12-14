import 'package:flutter/material.dart';
import 'package:flutter_project/modules/Shop_App/login_screen/shop_login_screen.dart';
import 'package:flutter_project/shared/components/components.dart';
import 'package:flutter_project/shared/network/local/cache_helper.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardinModel
{
   final String image;
   final String title;
   final String body;

  BoardinModel({
     required this.image,
    required this.title,
    required this.body,
});
}


class OnBoardingScreen extends StatelessWidget {
  List<BoardinModel> boarding = [
    BoardinModel(
        image: 'assets/images/onboarding_1.jpg',
        title: 'On Board 1 Title',
        body: 'On Board 1 Body',
    ),
    BoardinModel(
        image: 'assets/images/onboarding_1.jpg',
        title: 'On Board 2 Title',
        body: 'On Board 2 Body',
    ),
    BoardinModel(
        image: 'assets/images/onboarding_1.jpg',
        title: 'On Board 3 Title',
        body: 'On Board 3 Body',
    ),
  ];

  var boardController = PageController();

  bool isLast = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
              onPressed: ()
              {
                CacheHelper.saveData(
                    key: 'onBoarding',
                    value: true
                ).then((value) {
                  if(value) navigateAndFinish(context, ShopLoginScreen());
                });
              },
              child: Text('SKIP',style: TextStyle(color: Colors.deepOrange),))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index)
                {
                  if(index == 2){
                    isLast = true;
                  }else{
                    isLast = false;
                  }
                },
                controller: boardController,
                itemBuilder: (context,index) => buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            SizedBox(height: 40,),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: boardController,
                  count: boarding.length,
                  effect: ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: Colors.deepOrange,
                    dotHeight: 13,
                    dotWidth: 10,
                    spacing: 7,
                    expansionFactor: 2,
                  ),
                ),
                Spacer(),
                FloatingActionButton(
                  onPressed: ()
                  {
                      if(isLast)
                      {
                        CacheHelper.saveData(
                            key: 'onBoarding',
                            value: true
                        ).then((value) {
                          if(value) navigateAndFinish(context, ShopLoginScreen());
                        });
                      }
                      boardController.nextPage(
                      duration: Duration(milliseconds: 750),
                      curve: Curves.fastEaseInToSlowEaseOut,
                    );
                  },
                  child: Icon(Icons.arrow_forward_ios),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }


  Widget buildBoardingItem(fffff) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Image(image: AssetImage('${fffff.image}'))),
      SizedBox(height: 15,),
      Text(
        '${fffff.title}',
        style: TextStyle(
          fontSize: 25,
        ),
      ),
      SizedBox(height: 15,),
      Text(
        '${fffff.body}',
        style: TextStyle(
          fontSize: 15,
        ),
      ),
    ],
  );
}
