import 'package:flutter/material.dart';
import 'package:ibrahim_project/core/utiles/components.dart';
import 'package:ibrahim_project/features/home/presentation/views/home_view.dart';
import 'package:ibrahim_project/features/login/presentation/views/widgets/custom_button.dart';
import 'package:ibrahim_project/features/register/presentation/views/register_view.dart';
import 'custom_text_field.dart';


class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});
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
                    text: 'Login',
                  ),
                  const SizedBox(height: 10),
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: Row(
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                            onPressed: () {
                              navigateTo(context, const RegisterView());
                            },
                            child: const Text('Register', style: TextStyle(color: Colors.blue),)),
                      ],
                    ),
                  )
                ],
              ),
            )
        )
    );
  }
}
