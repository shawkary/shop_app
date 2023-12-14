import 'package:buildcondition/buildcondition.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_project/layout/shop_app/cubit/states.dart';
import 'package:flutter_project/models/shop_app_model/home_model.dart';

import '../../../../models/shop_app_model/category_model.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (context, state) {},
      builder: (context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        return BuildCondition(
          condition: cubit.homeModel != null,
          builder: (context) => productsBuilder(cubit.homeModel,cubit.categoryModel,cubit),
          fallback: (context) => Center(child: CircularProgressIndicator(),),
        );
      },
    );
  }

  Widget productsBuilder(HomeModel? model,CategoryModel? dodo,cubit) => SingleChildScrollView(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CarouselSlider(
            items: model?.data?.banners?.map((e) => Image(
              image: NetworkImage('${e.image}'),
              width: double.infinity,
              fit: BoxFit.cover,
            )).toList(),
            options: CarouselOptions(
              height: 250,
              initialPage: 0,
              autoPlay: true,
              viewportFraction: 1,
              enableInfiniteScroll: true,
              autoPlayAnimationDuration: Duration(seconds: 1),
              autoPlayInterval: Duration(seconds: 3),
              autoPlayCurve: Curves.fastOutSlowIn,
              scrollDirection: Axis.horizontal,
            )
        ),
        SizedBox(height: 10,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold
              ),
              ),
              SizedBox(height: 10,),
              Container(
                height: 100,
                child: ListView.separated(
                    itemBuilder: (context, index) => CategoriesBuilder(dodo.data!.data![index]),
                    separatorBuilder: (context, index) => Container(color: Colors.grey[500],child: SizedBox(width: 10,)),
                    itemCount: dodo!.data!.data!.length,
                    scrollDirection: Axis.horizontal,
                ),
              ),
              SizedBox(height: 10,),
              Text(
                'New Products',style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),
              ),
            ],
          ),
        ),
        Container(
          color: Colors.white,
          child: GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              mainAxisSpacing: 1,
              crossAxisSpacing: 1,
              childAspectRatio: 1 / 1.51,
              crossAxisCount: 2,
              children: List.generate(
                  model!.data!.products!.length,
                  (index) => buildGridProduct(model.data!.products![index],cubit)
              ),
          ),
        )
      ],
    ),
  );

  Widget buildGridProduct(Products model,cubit) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Image(
              image: NetworkImage('${model.image}'),
              width: double.infinity,
              height: 200,
          ),
          if(model.discount != 0)
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            color: Colors.red,
            child: Text(
              'DISCOUNT',
              style: TextStyle(
                fontSize: 8,
                color: Colors.white
              ),
            ),
          )
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${model.name}',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 14,
                height: 1.3
              ),
            ),
            Row(
              children: [
                Text(
                  '${model.price}',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red
                  ),
                ),
                SizedBox(width: 5,),
                if(model.discount != 0)
                Text(
                  '${model.oldPrice}',
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[700],
                      decoration: TextDecoration.lineThrough,
                  ),
                ),
                Spacer(),
                IconButton(
                    onPressed: ()
                    {
                      cubit.changeFavorites(model.id);
                      print('${model.id}');
                    },
                    icon: Icon(
                      cubit.favorites[model.id]? Icons.favorite : Icons.favorite_border,
                      size: 12,
                      color: cubit.favorites[model.id]? Colors.red : Colors.black,
                    )
                )
              ],
            ),
          ],
        ),
      ),
    ],
  );

  Widget CategoriesBuilder(Info ggg) => Stack(
    alignment: AlignmentDirectional.bottomCenter,
    children: [
      Image(image: NetworkImage(
          '${ggg.image}'
          ),
          height: 100,
          width: 150,
          fit: BoxFit.fill,
      ),
      Container(
        width: 150,
        color: Colors.black.withOpacity(.6),
        child: Text(
          '${ggg.name}',
           style: TextStyle(color: Colors.white),
           textAlign: TextAlign.center,
        ),
      )
    ],
  );
}
