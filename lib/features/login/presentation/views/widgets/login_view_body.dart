import 'package:flutter/material.dart';
import 'package:ibrahim_project/features/login/presentation/views/widgets/custom_button.dart';
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
                    label: 'Email',
                  ),
                  const SizedBox(height: 20),
                  const CustomTextFormField(
                    prefixIcon: Icons.lock,
                    label: 'Password',
                  ),
                  const SizedBox(height: 40),
                  CustomButton(
                    onPressed: ()
                    {
                      if(formKey.currentState!.validate()){

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
