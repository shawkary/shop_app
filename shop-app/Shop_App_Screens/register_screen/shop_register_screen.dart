import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/shop_app/shop_layout.dart';
import 'package:flutter_project/modules/Shop_App/on_boarding/on_boarding.dart';
import 'package:flutter_project/modules/Shop_App/register_screen/register_cubit/cubit.dart';
import 'package:flutter_project/modules/Shop_App/register_screen/register_cubit/states.dart';
import 'package:flutter_project/shared/components/components.dart';
import 'package:flutter_project/shared/components/constants.dart';
import 'package:flutter_project/shared/network/local/cache_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

class ShopRegisterScreen extends StatelessWidget {
   const ShopRegisterScreen({super.key});

   static final formKey = GlobalKey<FormState>();

   static final emailController = TextEditingController();
   static final passwordController = TextEditingController();
   static final nameController = TextEditingController();
   static final phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => ShopRegisterCubit(),
      child: BlocConsumer<ShopRegisterCubit, ShopRegisterStates>(
        listener: (BuildContext context, state) {
          if(state is ShopRegisterSuccessState){
            if(state.registerModel.status!){
              CacheHelper.saveData(
                  key: 'token',
                  value: state.registerModel.data?.token,
              ).then((value){
                token = state.registerModel.data?.token;
                navigateAndFinish(context, ShopLayout());
              });
              Fluttertoast.showToast(
                  msg: state.registerModel.message!,
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 5,
                  backgroundColor: Colors.green,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            }
          }
        },
        builder: (BuildContext context, Object? state) {
          ShopRegisterCubit cubit = ShopRegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value)
                          {
                            if(value.isEmpty){
                              return 'email must not be empty';
                            }
                          },
                          label: 'Email Address',
                          prefix: Icons.email,
                        ),
                        SizedBox(height: 20,),
                        defaultFormField(
                          controller: passwordController,
                          type: TextInputType.visiblePassword,
                          validate: (value)
                          {
                            if(value.isEmpty){
                              return 'Password must not be empty';
                            }
                          },
                          label: 'Password',
                          prefix: Icons.lock,
                          secret: cubit.isSecret,
                          suffixIcon: cubit.isSecret? Icons.visibility : Icons.visibility_off,
                          suffixFunction: ()
                            {
                              cubit.changeIconPassword();
                            }
                        ),
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
                          label: 'Name',
                          prefix: Icons.person,
                        ),
                        SizedBox(height: 20,),
                        defaultFormField(
                            controller: phoneController,
                            type: TextInputType.phone,
                            validate: (value)
                            {
                              if(value.isEmpty){
                                return 'Phone must not be empty';
                              }
                            },
                            label: 'Phone',
                            prefix: Icons.phone
                        ),
                        SizedBox(height: 20,),
                        BuildCondition(
                          condition: state is !ShopRegisterLoadingState,
                          builder: (context) => defaultButton(
                            function: ()
                            {
                              if(formKey.currentState!.validate()){
                                cubit.postRegisterData(
                                  userEmail: emailController.text,
                                  userPassword: passwordController.text,
                                  userName: nameController.text,
                                  userPhone: phoneController.text,
                                );
                              }
                            },
                            text: 'Register',
                          ),
                          fallback: (context) => Center(child: CircularProgressIndicator()),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
