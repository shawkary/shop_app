import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/errors/custom_error_widget.dart';
import 'package:ibrahim_project/features/home/presentation/manager/product_cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/manager/product_cubit/states.dart';


class CustomCarousalSlider extends StatelessWidget {
  const CustomCarousalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        if (state is SuccessHomeState) {
          return CarouselSlider(
            options: CarouselOptions(
              height: 220.0,
              autoPlay: true,
              viewportFraction: 1,
            ),
            items: state.homeModel.data!.banners!.map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return CachedNetworkImage(
                    imageUrl: i.image!,
                    width: double.infinity,
                    fit: BoxFit.fill,
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator())
                  );
                },
              );
            }).toList(),
          );
        } else if (state is ErrorHomeState) {
          return Center(
              child: CustomErrorWidget(errMessage: state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
