import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/shared/components/components.dart';
import 'cubit/search_cubit.dart';
import 'cubit/search_states.dart';

class ShopSearchScreen extends StatelessWidget {
  const ShopSearchScreen({super.key});

  static final formKey = GlobalKey<FormState>();
  static final textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SearchCubit, SearchStates>(
      listener: (BuildContext context, state) {},
      builder: (BuildContext context, Object? state) {
        SearchCubit cubit = SearchCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: Padding(
              padding: EdgeInsets.all(15.0),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    defaultFormField(
                      controller: textController,
                      type: TextInputType.text,
                      validate: (value)
                      {
                        if(value.isEmpty){
                          return 'Enter your search';
                        }
                        return null;
                      },
                      label: 'Search',
                      prefix: Icons.search,
                      submit: (text)
                        {
                          if(formKey.currentState!.validate()){
                            cubit.postSearchData(text);
                          }
                        }
                    ),
                    SizedBox(height: 20,),
                    if(state is ShopLoadingSearchDataState)
                      LinearProgressIndicator(),
                    SizedBox(height: 20,),
                    if(state is ShopSuccessSearchDataState)
                      Expanded(
                      child: ListView.separated(
                          itemBuilder: (context, index) => Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                alignment: AlignmentDirectional.bottomEnd,
                                children: [
                                  Image(
                                      width: 200,
                                      height: 200,
                                      image: NetworkImage('${cubit.searchModel!.data!.data![index].images![0]}')
                                  ),
                                  if(cubit.searchModel!.data!.data![index].discount != null)
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
                                      '${cubit.searchModel!.data!.data![index].name}',
                                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Text(
                                      '${cubit.searchModel!.data!.data![index].description}',
                                      style: TextStyle(fontSize: 14,color: Colors.grey[600]),
                                      maxLines: 3,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 45,),
                                    Row(
                                      children: [
                                        Text(
                                          '${cubit.searchModel!.data!.data![index].price}'
                                        ),
                                        SizedBox(width: 10,),
                                        if(cubit.searchModel!.data!.data![index].discount != null)
                                          Text(
                                              '${cubit.searchModel!.data!.data![index].oldPrice}'
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          separatorBuilder: (context, index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: double.infinity,
                              height: 1,
                              color: Colors.grey,
                            ),
                          ),
                          itemCount: cubit.searchModel!.data!.data!.length,
                      ),
                    ),
                  ],
                ),
              ),
            ),
        );
      },
    );
  }

}
