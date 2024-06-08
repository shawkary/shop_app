import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarousalSlider extends StatelessWidget {
  const CustomCarousalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 220.0,
        autoPlay: true,
        viewportFraction: 1,
      ),
      items: [1,2,3,4,5].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    color: Colors.amber
                ),
                child: Text('text $i', style: const TextStyle(fontSize: 16.0),)
            );
          },
        );
      }).toList(),
    );
  }
}
