import 'package:flutter/cupertino.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';

class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
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
                const Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        'Name', style: Styles.textStyle25,),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        'description', style: Styles.textStyle20,),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      itemCount: 7,
    );
  }
}
