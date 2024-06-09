import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';


class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 7),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Image(
                  fit: BoxFit.fill,
                    height: 200,
                    width: 180,
                    image: NetworkImage('https://i.natgeofe.com/k/63b1a8a7-0081-493e-8b53-81d01261ab5d/red-panda-full-body_4x3.jpg')),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('name' , style: Styles.textStyle20,),
                    const SizedBox(height: 130),
                    Row(
                      children: [
                        const Text('price' , style: Styles.textStyle16),
                        const SizedBox(width: 5),
                        Text('old price' , style: Styles.textStyle16.copyWith(
                            color: Colors.grey, decoration: TextDecoration.lineThrough)),
                        const SizedBox(width: 50),
                        IconButton(
                            onPressed: (){},
                            icon: const Icon(Icons.favorite, size: 20, color: Colors.grey,))
                      ],
                    ),
                  ],
                )
              ],
            ),
          );
        },
      itemCount: 10,
    );
  }
}
