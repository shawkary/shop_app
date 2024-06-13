import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';
import 'package:ibrahim_project/features/home/data/model/product_model/Products.dart';

class CustomGridViewItem extends StatelessWidget {
  const CustomGridViewItem(this.product, {super.key});
  final Products product;

  @override
  Widget build(BuildContext context) {
       return Container(
         decoration: BoxDecoration(
           border: Border.all(width: .1),
         ),
         child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: AlignmentDirectional.bottomStart,
                  children: [
                    CachedNetworkImage(
                      imageUrl: product.image!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                    ),
                    if(product.discount != 0)
                      Container(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      color: Colors.red,
                      child: Text(
                        'discount: ${product.discount!}',
                        style: const TextStyle(
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
                      Text(
                        product.name!,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle16,
                      ),
                      Text(
                        product.description!,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.textStyle14.copyWith(color: Colors.grey[600]),
                      ),
                      Row(
                        children: [
                          Text(
                            '${product.price}',
                            style: Styles.textStyle14.copyWith(color: Colors.red),
                          ),
                          const SizedBox(width: 5),
                          if(product.discount != 0)
                            Text(
                            '${product.oldPrice}',
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
            ),
       );
  }
}
