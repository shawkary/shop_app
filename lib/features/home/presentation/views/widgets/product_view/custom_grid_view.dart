import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/data/model/product_model/Products.dart';
import 'custom_grid_view_item.dart';


class CustomGridView extends StatelessWidget {
  const CustomGridView(this.product, {super.key});
  final List<Products> product;

  @override
  Widget build(BuildContext context) {
      return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              mainAxisExtent: 340,
            ),
            itemBuilder: (context, index) {
              return CustomGridViewItem(product[index]);
            },
            itemCount: product.length,
          );
  }
}
