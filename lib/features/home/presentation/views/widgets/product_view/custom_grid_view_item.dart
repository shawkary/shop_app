import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            const Image(
              image: NetworkImage('https://i.natgeofe.com/k/63b1a8a7-0081-493e-8b53-81d01261ab5d/red-panda-full-body_4x3.jpg'),
              width: double.infinity,
              fit: BoxFit.fill,
              height: 200,
            ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                color: Colors.red,
                child: const Text(
                  'DISCOUNT',
                  style: TextStyle(
                      fontSize: 8,
                      color: Colors.white
                  ),
                ),
              )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'name',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: Styles.textStyle14,
              ),
              Row(
                children: [
                  const Text(
                    'price',
                    style: Styles.textStyle14,
                  ),
                  const SizedBox(width: 5),
                    Text(
                      'oldPrice',
                      style: Styles.textStyle14.copyWith(
                          color: Colors.grey[700],
                          decoration: TextDecoration.lineThrough),
                    ),
                  const Spacer(),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.favorite,
                        size: 12,
                        color: Colors.grey,
                      )
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
