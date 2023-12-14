import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project/layout/shop_app/shop_layout.dart';
import 'package:flutter_project/modules/Shop_App/login_screen/cubit/cubit.dart';
import 'package:flutter_project/modules/Shop_App/login_screen/cubit/states.dart';
import 'package:flutter_project/modules/Shop_App/on_boarding/on_boarding.dart';
import 'package:flutter_project/shared/components/components.dart';
import 'package:flutter_project/shared/network/local/cache_helper.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../shared/components/constants.dart';
import '../register_screen/shop_register_screen.dart';

class ShopLoginScreen extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => ShopLoginCubit(),
      child: BlocConsumer<ShopLoginCubit, ShopLoginStates>(
        listener: (BuildContext context, ShopLoginStates state) {
          if (state is ShopLoginSuccessState) {
            if (state.loginModel.status!) {
              print(state.loginModel.message);
              print(state.loginModel.status);
              print(state.loginModel.data?.token);
              CacheHelper.saveData(
                  key: 'token',
                  value: state.loginModel.data?.token).then((value) {
                    token = state.loginModel.data!.token!;
                    navigateAndFinish(context, ShopLayout());
              });
              Fluttertoast.showToast(
                  msg: state.loginModel.message!,
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
        builder: (BuildContext context, ShopLoginStates state) {
          ShopLoginCubit cubit = ShopLoginCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                              color: Colors.deepOrange,
                              fontSize: 35,
                              fontWeight: FontWeight.bold),
                        ),
                        Text('login now to browse our hot offers',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[500],
                            )),
                        SizedBox(
                          height: 40,
                        ),
                        defaultFormField(
                          controller: emailController,
                          type: TextInputType.emailAddress,
                          validate: (value) {
                            if (value!.isEmpty) {
                              return 'This field can\'t be empty';
                            }
                            return null;
                          },
                          label: 'Email Address',
                          prefix: Icons.email,
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        defaultFormField(
                            controller: passwordController,
                            type: TextInputType.visiblePassword,
                            validate: (value) {
                              if (value!.isEmpty) {
                                return 'This field can\'t be empty';
                              }
                              return null;
                            },
                            label: 'Password',
                            prefix: Icons.lock,
                            secret: cubit.obsecureText,
                            suffixIcon: cubit.obsecureText
                                ? Icons.visibility
                                : Icons.visibility_off,
                            suffixFunction: () {
                              cubit.changeEyePassword();
                            }),
                        SizedBox(
                          height: 40,
                        ),
                        BuildCondition(
                          condition: state is! ShopLoginLoadingState,
                          builder: (context) => Container(
                            width: double.infinity,
                            decoration: BoxDecoration(color: Colors.deepOrange),
                            child: TextButton(
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    cubit.userLogin(
                                      email: emailController.text,
                                      password: passwordController.text,
                                    );
                                  }
                                },
                                child: Text(
                                  'Log in',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                          fallback: (context) =>
                              Center(child: CircularProgressIndicator()),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an acount ?',
                            ),
                            TextButton(
                              onPressed: () {
                                navigateTo(context, ShopRegisterScreen());
                              },
                              child: Text(
                                'Register now',
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.deepOrange,
                                ),
                              ),
                            )
                          ],
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
