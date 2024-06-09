import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/components.dart';
import 'package:ibrahim_project/features/home/presentation/views/home_view.dart';
import '../../../../../core/custom_widgets/custom_button.dart';
import '../../../../../core/custom_widgets/custom_text_field.dart';


class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});
  static final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const CustomTextFormField(
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.name,
                    label: 'Name',
                  ),
                  const SizedBox(height: 20),
                  const CustomTextFormField(
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.phone,
                    label: 'Phone',
                  ),
                  const SizedBox(height: 20),
                  const CustomTextFormField(
                    prefixIcon: Icons.email,
                    keyboardType: TextInputType.emailAddress,
                    label: 'Email',
                  ),
                  const SizedBox(height: 20),
                  const CustomTextFormField(
                    prefixIcon: Icons.lock,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    label: 'Password',
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    onPressed: ()
                    {
                      if(formKey.currentState!.validate()){
                        navigateTo(context, const HomeView());
                      }
                    },
                    text: 'Register',
                  ),
                ],
              ),
            )
        )
    );
  }
}