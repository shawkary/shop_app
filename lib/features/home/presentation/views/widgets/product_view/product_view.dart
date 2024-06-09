import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';
import 'carousal_slider.dart';
import 'category_list_view.dart';
import 'custom_grid_view.dart';


class ProductView extends StatelessWidget {
  const ProductView({super.key});

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
                SizedBox(height: 20),
                Text('  Products', style: Styles.textStyle25,),
              ]
          ),
        ),
        SliverToBoxAdapter(
          child: CustomGridView(),
        ),
      ],
    );
  }
}
