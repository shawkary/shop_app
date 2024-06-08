import 'package:flutter/cupertino.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      width: 150,
                        height: 150,
                        fit: BoxFit.fill,
                        image: NetworkImage('https://i.natgeofe.com/k/63b1a8a7-0081-493e-8b53-81d01261ab5d/red-panda-full-body_4x3.jpg')),
                  ),
                  SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Name', style: Styles.textStyle25,),
                      Text('description', style: Styles.textStyle20,),
                    ],
                  )
                ],
              ),
            );
          },
        itemCount: 7,
      ),
    );
  }
}
