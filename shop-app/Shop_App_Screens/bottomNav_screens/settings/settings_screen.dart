import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/shop_app/cubit/cubit.dart';
import 'package:flutter_project/layout/shop_app/cubit/states.dart';
import 'package:flutter_project/shared/components/components.dart';

import '../../../../shared/network/local/cache_helper.dart';
import '../../login_screen/shop_login_screen.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  var formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopStates>(
      listener: (BuildContext context, ShopStates state) {},
      builder: (BuildContext context, ShopStates state) {
        ShopCubit cubit = ShopCubit.get(context);
        nameController.text = cubit.userModel!.data!.name!;
        emailController.text = cubit.userModel!.data!.email!;
        phoneController.text = cubit.userModel!.data!.phone!;
        return Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    if(state is ShopLoadingUpdateDataState)
                    LinearProgressIndicator(),
                    SizedBox(height: 20,),
                    defaultFormField(
                      controller: nameController,
                      type: TextInputType.name,
                      validate: (value)
                      {
                        if(value.isEmpty){
                          return 'Name must not be empty';
                        }
                      },
                      label: 'name',
                      prefix: Icons.person,
                    ),
                    SizedBox(height: 20,),
                    defaultFormField(
                      controller: emailController,
                      type: TextInputType.emailAddress,
                      validate: (value)
                      {
                        if(value.isEmpty){
                          return 'Email must not be empty';
                        }
                      },
                      label: 'Email Address',
                      prefix: Icons.email,
                    ),
                    SizedBox(height: 20,),
                    defaultFormField(
                      controller: phoneController,
                      type: TextInputType.number,
                      validate: (value)
                      {
                        if(value.isEmpty){
                          return 'Phone must not be empty';
                        }
                      },
                      label: 'Phone Number',
                      prefix: Icons.phone,
                    ),
                    SizedBox(height: 20,),
                    defaultButton(
                        function: ()
                        {
                          if(formKey.currentState!.validate()){
                            cubit.putUpdateData(
                              name: nameController.text,
                              email: emailController.text,
                              phone: phoneController.text,
                            );
                          }
                        },
                        text: 'Update'
                    ),
                    SizedBox(height: 20,),
                    defaultButton(
                        function: ()
                        {
                          CacheHelper.removeData(key: 'token').then((value){
                            if(value){
                              navigateAndFinish(context, ShopLoginScreen());
                            }
                          });
                        },
                        text: 'logout'
                    ),
                    SizedBox(height: 20,),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
