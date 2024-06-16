import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/utiles/styles.dart';
import 'package:ibrahim_project/features/home/presentation/manager/favorite_cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/manager/favorite_cubit/states.dart';


class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavoriteCubit, FavoriteStates>(
      builder: (BuildContext context, state) {
        FavoriteCubit cubit = FavoriteCubit.get(context);
          return ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 7, left: 7),
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: .2)
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CachedNetworkImage(
                          fit: BoxFit.fill,
                          width: 180,
                          imageUrl: cubit.favoriteList[index]['product']['image'],
                        errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
                      ),
                      const SizedBox(width: 5),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('name' , style: Styles.textStyle20,),
                          // const SizedBox(height: 100),
                          Row(
                            children: [
                              const Text('price' , style: Styles.textStyle16),
                              const SizedBox(width: 5),
                              Text('old price' , style: Styles.textStyle16.copyWith(
                                  color: Colors.grey, decoration: TextDecoration.lineThrough)),
                              IconButton(
                                  onPressed: (){},
                                  icon: const Icon(Icons.favorite, size: 20, color: Colors.grey,))
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              );
            },
            itemCount: cubit.favoriteList.length,
          );
      },
    );
  }
}
