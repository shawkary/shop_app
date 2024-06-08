import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';
import 'package:ibrahim_project/features/home/presentation/views/widgets/products_list_view.dart';
import 'carousal_slider.dart';
import 'category_list_view.dart';


class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCarousalSlider(),
                SizedBox(height: 10),
                Text('  Categories', style: Styles.textStyle25,),
                CategoryListView(),
                SizedBox(height: 10),
                Text('  Products', style: Styles.textStyle25,),
              ]
          ),
        ),
        SliverToBoxAdapter(
          child: ProductsListView(),
        ),
      ],
    );
  }
}
