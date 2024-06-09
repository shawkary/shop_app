import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/product_view/product_list_view_item.dart';


class ProductsListView extends StatelessWidget {
  const ProductsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return const ProductListViewItem();
        },
      itemCount: 7,
    );
  }
}
