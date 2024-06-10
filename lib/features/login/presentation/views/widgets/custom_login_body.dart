import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/custom_widgets/custom_button.dart';
import 'package:ibrahim_project/core/errors/custom_error_widget.dart';
import 'package:ibrahim_project/core/utiles/components.dart';
import 'package:ibrahim_project/features/home/presentation/views/home_view.dart';
import '../../../../../core/utiles/dio_helper.dart';
import '../../manager/login_cubit/cubit.dart';
import '../../manager/login_cubit/states.dart';

class CustomLoginButton extends StatelessWidget {
  const CustomLoginButton(
     this.emailController,
     this.passwordController,
      {super.key,
    this.color = Colors.blue,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LoginCubit(DioHelper(Dio())),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (context, state) {
            if(state is SuccessLoginState){
              if(state.loginModel.status!){
                navigateTo(context, const HomeView());
              }
            }
          },
        builder: (BuildContext context, state) {
          LoginCubit cubit = LoginCubit.get(context);
          if (state is SuccessLoginState) {
            return CustomButton(
                onPressed: ()
                {
                  cubit.postLogin(
                      email: emailController.text,
                      password: passwordController.text,
                  );
                },
                text: 'Login',
            );
          }else if(state is ErrorLoginState){
            return CustomErrorWidget(errMessage: state.errMessage);
          }else if(state is LoadingLoginState){
            return const Center(child: CircularProgressIndicator());
          }else{
            return CustomButton(
              onPressed: ()
              {
                cubit.postLogin(
                  email: emailController.text,
                  password: passwordController.text,
                );
              },
              text: 'Login',
            );
          }
        },
    )
    );
  }
  }
