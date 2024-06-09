import 'package:flutter/material.dart';
import 'custom_grid_view_item.dart';


class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          mainAxisSpacing: 5,
          crossAxisSpacing: 5,
          mainAxisExtent: 290,
        ),
        itemBuilder: (context, index) {
          return const CustomGridViewItem();
        },
      itemCount: 12,
    );
  }
}
