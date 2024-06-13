import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/errors/custom_error_widget.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';
import 'package:ibrahim_project/features/home/presentation/manager/category_cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/manager/category_cubit/states.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryStates>(
      builder: (BuildContext context, state) {
        if (state is SuccessCategoryState) {
          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: .2, color: Colors.red)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(state.categoryModel.data!.data![index].name!,
                                style: Styles.textStyle20.copyWith(fontStyle: FontStyle.italic, color: Colors.blue)),
                            CachedNetworkImage(
                              width: 150,
                              height: 150,
                              fit: BoxFit.fill,
                              imageUrl:
                                  state.categoryModel.data!.data![index].image!,
                            )
                          ],
                        ),
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.chevron_right,
                            size: 40,
                            color: Colors.blue,
                          ))
                    ],
                  ),
                ),
              );
            },
            itemCount: state.categoryModel.data!.data!.length,
          );
        } else if (state is ErrorCategoryState) {
          return Center(child: CustomErrorWidget(errMessage: state.errMessage));
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
