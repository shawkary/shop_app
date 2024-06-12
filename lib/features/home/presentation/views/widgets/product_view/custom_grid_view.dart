import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/features/home/presentation/manager/product_cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/manager/product_cubit/states.dart';
import '../../../../../../core/errors/custom_error_widget.dart';
import 'custom_grid_view_item.dart';


class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
      builder: (BuildContext context, state) {
        if (state is SuccessHomeState) {
          return GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              mainAxisExtent: 340,
            ),
            itemBuilder: (context, index) {
              return CustomGridViewItem(state.homeModel.data!.products![index]);
            },
            itemCount: state.homeModel.data!.products!.length,
          );
        }else if(state is ErrorHomeState){
          return Center(child: CustomErrorWidget(errMessage: state.errMessage));
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
