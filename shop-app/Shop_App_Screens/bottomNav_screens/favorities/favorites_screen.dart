import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_project/layout/shop_app/cubit/states.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, ShopStates state) {},
      builder: (BuildContext context, ShopStates state) {
        ShopCubit cubit = ShopCubit.get(context);
        return Scaffold(
          body: ListView.separated(
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Image(
                          width: 200,
                          height: 200,
                          image: NetworkImage('${cubit.favoriteModel!.data!.data![index].product?.image}')
                      ),
                      if(cubit.favoriteModel!.data!.data![index].product?.discount != 0)
                        Container(
                          width: 50,
                          height: 17,
                          color: Colors.red,
                          child: Text(
                            'Discount',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 10
                            ),
                          ),
                        )
                    ],
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cubit.favoriteModel!.data!.data![index].product?.name}',
                          style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          '${cubit.favoriteModel!.data!.data![index].product?.description}',
                          style: TextStyle(fontSize: 14,color: Colors.grey[600]),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(height: 45,),
                        Row(
                          children: [
                            Text(
                                '${cubit.favoriteModel!.data!.data![index].product?.price}'
                            ),
                            SizedBox(width: 10,),
                            if(cubit.favoriteModel!.data!.data![index].product?.discount != 0)
                              Text(
                                '${cubit.favoriteModel!.data!.data![index].product?.oldPrice}',
                                style: TextStyle(decoration: TextDecoration.lineThrough),
                              ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
            ),
            itemCount: cubit.favoriteModel!.data!.data!.length,
          ),
        );
      },
    );
  }
}