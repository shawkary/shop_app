import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/errors/custom_error_widget.dart';
import 'package:ibrahim_project/features/home/presentation/manager/category_cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/manager/category_cubit/states.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
      builder: (BuildContext context, state) {
        if (state is SuccessCategoryState) {
          return SizedBox(
            height: 100,
            child: ListView.builder(
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: CachedNetworkImage(
                    width: 120,
                      fit: BoxFit.fill,
                      imageUrl: state.categoryModel.data!.data![index].image!,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                  )
                );
              },
              itemCount: state.categoryModel.data!.data!.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        }else if(state is ErrorCategoryState){
          return Center(child: CustomErrorWidget(errMessage: state.errMessage));
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
