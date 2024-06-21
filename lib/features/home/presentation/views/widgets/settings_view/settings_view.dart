import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ibrahim_project/core/custom_widgets/custom_button.dart';
import 'package:ibrahim_project/core/custom_widgets/custom_text_field.dart';
import 'package:ibrahim_project/features/home/presentation/manager/shop_cubit/cubit.dart';
import 'package:ibrahim_project/features/home/presentation/manager/shop_cubit/states.dart';

import '../../../../../../core/errors/custom_error_widget.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
        var nameController = TextEditingController();
        var emailController = TextEditingController();
        var phoneController = TextEditingController();
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (BuildContext context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        nameController.text = cubit.loginModel!.data!.name!;
        emailController.text = cubit.loginModel!.data!.email!;
        phoneController.text = cubit.loginModel!.data!.phone!;
        if (cubit.loginModel != null) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                   CustomTextFormField(
                     controller: nameController,
                    hintText: cubit.loginModel!.data!.name!,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.person,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: emailController,
                    hintText: cubit.loginModel!.data!.email!,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    controller: phoneController,
                    hintText: cubit.loginModel!.data!.phone!,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icons.phone,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    onPressed: ()
                    {
                      cubit.updateProfile(
                          name: nameController.text,
                          email: emailController.text,
                          phone: phoneController.text,
                      );
                    },
                    text: 'Update',
                  ),
                  if(state is LoadingUpdateProfileState)
                    const LinearProgressIndicator(),
                  const SizedBox(height: 100),
                  CustomButton(
                    onPressed: (){},
                    text: 'Logout',
                    color: Colors.redAccent,
                  )
                ],
              ),
            ),
          );
        }else if(cubit.errCategory != null){
          return Center(child: CustomErrorWidget(errMessage: cubit.errProfile!));
        }else{
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
