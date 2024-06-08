import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';

import 'carousal_slider.dart';
import 'category_list_view.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomCarousalSlider(),
          SizedBox(height: 10),
          Text('Categories', style: Styles.textStyle25,),
        ]
    );
  }
}
