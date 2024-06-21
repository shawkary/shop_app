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
    return BlocBuilder<ShopCubit, ShopStates>(
      builder: (BuildContext context, state) {
        ShopCubit cubit = ShopCubit.get(context);
        if (cubit.loginModel != null) {
          return Center(
            child: SingleChildScrollView(
              child: Column(
                children: [
                   CustomTextFormField(
                    label: cubit.loginModel!.data!.name!,
                    keyboardType: TextInputType.name,
                    prefixIcon: Icons.person,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    label: cubit.loginModel!.data!.email!,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: Icons.email,
                  ),
                  const SizedBox(height: 20),
                  CustomTextFormField(
                    label: cubit.loginModel!.data!.phone!,
                    keyboardType: TextInputType.phone,
                    prefixIcon: Icons.phone,
                  ),
                  const SizedBox(height: 30),
                  CustomButton(
                    onPressed: (){},
                    text: 'Update',
                  ),
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
