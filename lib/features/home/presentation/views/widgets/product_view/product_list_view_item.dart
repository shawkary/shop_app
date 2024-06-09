import 'package:flutter/material.dart';

import '../../../../../../core/utiles/styles.dart';

class ProductListViewItem extends StatelessWidget {
  const ProductListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: const Image(
                width: 150,
                height: 150,
                fit: BoxFit.fill,
                image: NetworkImage('https://i.natgeofe.com/k/63b1a8a7-0081-493e-8b53-81d01261ab5d/red-panda-full-body_4x3.jpg')),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  'Name', style: Styles.textStyle25,),
                const Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  'description', style: Styles.textStyle20,),
                const SizedBox(height: 45),
                Row(
                  children: [
                    const Text(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      'Price', style: Styles.textStyle16,),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: IconButton(
                        onPressed: (){},
                        icon: const Icon(Icons.favorite, color: Colors.grey, size: 20,),
                      ),
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
