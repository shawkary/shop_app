import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_project/layout/shop_app/cubit/states.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        ShopCubit cubit = ShopCubit.get(context);
        return Scaffold(
          body: ListView.separated(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) => Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cubit.categoryModel?.data!.data?[index].name}',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Image(
                          image: NetworkImage('${cubit.categoryModel?.data!.data?[index].image}'),
                          width: 150,
                          height: 150,
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  IconButton(onPressed: (){},
                    icon: Icon(Icons.chevron_right,size: 40,)
                    )
                ],
              ),
              separatorBuilder: (context, index) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 35.0),
                child: Container(
                  width: double.infinity,
                  height: 1,
                  color: Colors.black,
                ),
              ),
              itemCount: cubit.categoryModel!.data!.data!.length,
          ),
        );
      },
    );
  }
}
