import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';
import 'package:ibrahim_project/features/home/presentation/manager/product_cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/manager/product_cubit/states.dart';
import '../../../../../../core/errors/custom_error_widget.dart';
import 'carousal_slider.dart';
import 'category_list_view.dart';
import 'custom_grid_view.dart';


class ProductView extends StatelessWidget {
  const ProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        if (state is SuccessProductState) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomCarousalSlider(state.homeModel.data!.banners!),
                      const SizedBox(height: 15),
                      const Text('  Categories', style: Styles.textStyle20),
                      const CategoryListView(),
                      const SizedBox(height: 20),
                      const Text('  Products', style: Styles.textStyle20),
                    ]
                ),
              ),
               SliverToBoxAdapter(
                child: CustomGridView(state.homeModel.data!.products!),
              ),
            ],
          );
        }else if(state is ErrorProductState){
          return Center(child: CustomErrorWidget(errMessage: state.errMessage));
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
